Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3536155FC5B
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Jun 2022 11:45:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXxQy0bz8z3cgR
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Jun 2022 19:45:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=neal_liu@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXxQt3r8lz2ypf
	for <linux-aspeed@lists.ozlabs.org>; Wed, 29 Jun 2022 19:45:23 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 25T9SRxn051154;
	Wed, 29 Jun 2022 17:28:27 +0800 (GMT-8)
	(envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 29 Jun
 2022 17:44:31 +0800
From: Neal Liu <neal_liu@aspeedtech.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
        Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller"
	<davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@aj.id.au>,
        Dhananjay Phadke <dhphadke@microsoft.com>,
        "Johnny Huang" <johnny_huang@aspeedtech.com>
Subject: [PATCH v6 0/5] Add Aspeed crypto driver for hardware acceleration
Date: Wed, 29 Jun 2022 17:44:21 +0800
Message-ID: <20220629094426.1930589-1-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 25T9SRxn051154
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Aspeed Hash and Crypto Engine (HACE) is designed to accelerate the
throughput of hash data digest, encryption and decryption.

These patches aim to add Aspeed hash & crypto driver support.
The hash & crypto driver also pass the run-time self tests that
take place at algorithm registration.

The patch series are tested on both AST2500 & AST2600 evaluation boards.

Tested-by below configs:
- CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
- CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
- CONFIG_DMA_API_DEBUG=y
- CONFIG_DMA_API_DEBUG_SG=y
- CONFIG_CPU_BIG_ENDIAN=y

Change since v5:
- Re-define HACE clock define to fix breaking ABI.

Change since v4:
- Add AST2500 clock definition & dts node.
- Add software fallback for handling corner cases.
- Fix copy wrong key length.

Change since v3:
- Use dmam_alloc_coherent() instead to manage dma_alloc_coherent().
- Add more error handler of dma_prepare() & crypto_engine_start().

Change since v2:
- Fix endianness issue. Tested on both little endian & big endian
  system.
- Use common crypto hardware engine for enqueue & dequeue requests.
- Use pre-defined IVs for SHA-family.
- Revise error handler flow.
- Fix sorts of coding style problems.

Change since v1:
- Add more error handlers, including DMA memory allocate/free, DMA
  map/unmap, clock enable/disable, etc.
- Fix check dma_map error for config DMA_API_DEBUG.
- Fix dt-binding doc & dts node naming.


Neal Liu (5):
  crypto: aspeed: Add HACE hash driver
  dt-bindings: clock: Add AST2500/AST2600 HACE reset definition
  ARM: dts: aspeed: Add HACE device controller node
  dt-bindings: crypto: add documentation for aspeed hace
  crypto: aspeed: add HACE crypto driver

 .../bindings/crypto/aspeed,ast2500-hace.yaml  |   53 +
 MAINTAINERS                                   |    7 +
 arch/arm/boot/dts/aspeed-g5.dtsi              |    8 +
 arch/arm/boot/dts/aspeed-g6.dtsi              |    8 +
 drivers/crypto/Kconfig                        |    1 +
 drivers/crypto/Makefile                       |    1 +
 drivers/crypto/aspeed/Kconfig                 |   40 +
 drivers/crypto/aspeed/Makefile                |    8 +
 drivers/crypto/aspeed/aspeed-hace-crypto.c    | 1122 +++++++++++++
 drivers/crypto/aspeed/aspeed-hace-hash.c      | 1428 +++++++++++++++++
 drivers/crypto/aspeed/aspeed-hace.c           |  301 ++++
 drivers/crypto/aspeed/aspeed-hace.h           |  293 ++++
 include/dt-bindings/clock/aspeed-clock.h      |    1 +
 include/dt-bindings/clock/ast2600-clock.h     |    1 +
 14 files changed, 3272 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/aspeed,ast2500-hace.yaml
 create mode 100644 drivers/crypto/aspeed/Kconfig
 create mode 100644 drivers/crypto/aspeed/Makefile
 create mode 100644 drivers/crypto/aspeed/aspeed-hace-crypto.c
 create mode 100644 drivers/crypto/aspeed/aspeed-hace-hash.c
 create mode 100644 drivers/crypto/aspeed/aspeed-hace.c
 create mode 100644 drivers/crypto/aspeed/aspeed-hace.h

-- 
2.25.1

