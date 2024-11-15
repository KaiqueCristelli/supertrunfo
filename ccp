#include <stdio.h>
#include <string.h>

#define MAX_CARTAS 32  // Supondo que vamos ter no máximo 32 cartas (8 estados * 4 cidades)

typedef struct {
    char estado;                  // Letra do estado (A, B, C, ..., H)
    char codigo[4];               // Código da carta (como A01, B02, etc.)
    char nome[50];                // Nome da cidade
    int populacao;                // População da cidade
    float area;                   // Área da cidade em km²
    float pib;                    // PIB da cidade
    int pontos_turisticos;        // Número de pontos turísticos
} Carta;

// Função para cadastrar uma carta
void cadastrarCarta(Carta* carta) {
    printf("\nDigite o estado (letra de A a H): ");
    scanf(" %c", &carta->estado);  // O espaço antes do %c é para consumir o caractere de nova linha

    printf("Digite o código da carta (como A01, B02, etc.): ");
    scanf("%s", carta->codigo);

    printf("Digite o nome da cidade: ");
    scanf(" %[^\n]%*c", carta->nome);  // Para ler uma linha inteira com espaços

    printf("Digite a população: ");
    scanf("%d", &carta->populacao);

    printf("Digite a área (em km²): ");
    scanf("%f", &carta->area);

    printf("Digite o PIB (em milhões de R$): ");
    scanf("%f", &carta->pib);

    printf("Digite o número de pontos turísticos: ");
    scanf("%d", &carta->pontos_turisticos);

    printf("\nCarta cadastrada com sucesso!\n");
}

// Função para exibir os dados de uma carta
void exibirCarta(Carta carta) {
    printf("\n--- Dados da Carta Cadastrada ---\n");
    printf("Código da carta: %s\n", carta.codigo);
    printf("Estado: %c\n", carta.estado);
    printf("Nome da cidade: %s\n", carta.nome);
    printf("População: %d\n", carta.populacao);
    printf("Área: %.2f km²\n", carta.area);
    printf("PIB: R$ %.2f milhões\n", carta.pib);
    printf("Pontos turísticos: %d\n", carta.pontos_turisticos);
    printf("--------------------------------\n");
}

// Função para exibir o menu e controlar o fluxo do jogo
void menu() {
    Carta cartas[MAX_CARTAS];  // Array para armazenar as cartas cadastradas
    int numCartas = 0;         // Contador de cartas cadastradas
    int opcao;

    while (1) {
        printf("\nBem-vindo ao sistema de cadastro do Super Trunfo!\n");
        printf("1 - Cadastrar nova carta\n");
        printf("2 - Sair\n");
        printf("Escolha uma opção (1 ou 2): ");
        scanf("%d", &opcao);

        if (opcao == 1) {
            if (numCartas < MAX_CARTAS) {
                cadastrarCarta(&cartas[numCartas]);  // Passa o endereço para cadastrar a carta
                exibirCarta(cartas[numCartas]);      // Exibe a carta após o cadastro
                numCartas++;                         // Incrementa o número de cartas cadastradas
            } else {
                printf("Limite máximo de cartas atingido!\n");
            }
        } else if (opcao == 2) {
            printf("Saindo do sistema...\n");
            break;
        } else {
            printf("Opção inválida. Tente novamente.\n");
        }
    }
}

int main() {
    menu();  // Chama a função de controle do menu
    return 0;
}
