Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 045855AA77C
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Sep 2022 08:01:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJnNp2zStz3023
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Sep 2022 16:01:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=neal_liu@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJnNf1TZ1z2yZc
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Sep 2022 16:01:37 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 2825eWPB091012;
	Fri, 2 Sep 2022 13:40:32 +0800 (GMT-8)
	(envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 2 Sep
 2022 14:00:15 +0800
From: Neal Liu <neal_liu@aspeedtech.com>
To: Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        "Joel Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Rob
 Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        "Chia-Wei Wang --cc=linux-kernel @ vger
 . kernel . org" <chiawei_wang@aspeedtech.com>
Subject: [PATCH v1 0/4] Add Aspeed ACRY driver for hardware acceleration
Date: Fri, 2 Sep 2022 14:00:08 +0800
Message-ID: <20220902060012.3758637-1-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2825eWPB091012
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

Aspeed ACRY engine is designed to accelerate the throughput of
ECDSA/RSA signature and verification.

These patches aim to add Aspeed ACRY RSA driver support.
This driver also pass the run-time self tests that take place at
algorithm registration on both big-endian/little-endian system
in AST2600 evaluation board .

Tested-by below configs:
- CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
- CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
- CONFIG_DMA_API_DEBUG=y
- CONFIG_DMA_API_DEBUG_SG=y
- CONFIG_CPU_BIG_ENDIAN=y

Neal Liu (4):
  crypto: aspeed: Add ACRY RSA driver
  ARM: dts: aspeed: Add ACRY/AHBC device controller node
  dt-bindings: crypto: add documentation for Aspeed ACRY
  dt-bindings: bus: add documentation for Aspeed AHBC

 .../bindings/bus/aspeed,ast2600-ahbc.yaml     |  39 +
 .../bindings/crypto/aspeed,ast2600-acry.yaml  |  49 +
 MAINTAINERS                                   |   2 +-
 arch/arm/boot/dts/aspeed-g6.dtsi              |  13 +
 drivers/crypto/aspeed/Kconfig                 |  11 +
 drivers/crypto/aspeed/Makefile                |   5 +-
 drivers/crypto/aspeed/aspeed-acry.c           | 848 ++++++++++++++++++
 7 files changed, 965 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml
 create mode 100644 Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml
 create mode 100644 drivers/crypto/aspeed/aspeed-acry.c

-- 
2.25.1

