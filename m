Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C85BA25E008
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Sep 2020 18:44:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bjk5r2rVPzDqly
	for <lists+linux-aspeed@lfdr.de>; Sat,  5 Sep 2020 02:44:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=vV07QlSQ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bjk5Y56dFzDqly
 for <linux-aspeed@lists.ozlabs.org>; Sat,  5 Sep 2020 02:43:45 +1000 (AEST)
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D3362064E;
 Fri,  4 Sep 2020 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599237823;
 bh=nxciuoD47KxGkOpJC1/Yb+VqPBHDhps24SnDZPx4IXk=;
 h=From:To:Cc:Subject:Date:From;
 b=vV07QlSQWiamQPiw7TcgBV0AVn8g3VLYp4Y0YEpQajmWoDymFi6NXno5wrMIrWqbk
 IYPI85Ll5xGRHSi6KObRaeEGTM/DoL18I/V+Yzx29NgruQPi31ggY144MQCLaytdIg
 uZHZpn9PJ/8lwmzuvIfusuOcx36eP0X6eMPZ8fYk=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Manuel Lauss <manuel.lauss@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Prabu Thangamuthu <prabu.t@synopsys.com>,
 Manjunath M B <manjumb@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@axis.com
Subject: [PATCH v2 1/2] mmc: host: Drop unneeded MMC dependency in Kconfig
Date: Fri,  4 Sep 2020 18:43:14 +0200
Message-Id: <20200904164315.24618-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

All entries in Kconfig are already part of "if MMC", so there is no need
for additional dependency on MMC.

Suggested-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 drivers/mmc/host/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index b95f79f53395..eea01fde0591 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -422,7 +422,7 @@ config MMC_SDHCI_IPROC
 
 config MMC_MESON_GX
 	tristate "Amlogic S905/GX*/AXG SD/MMC Host Controller support"
-	depends on ARCH_MESON && MMC
+	depends on ARCH_MESON
 	help
 	  This selects support for the Amlogic SD/MMC Host Controller
 	  found on the S905/GX*/AXG family of SoCs.  This controller is
@@ -458,7 +458,7 @@ config MMC_MESON_MX_SDIO
 
 config MMC_MOXART
 	tristate "MOXART SD/MMC Host Controller support"
-	depends on ARCH_MOXART && MMC
+	depends on ARCH_MOXART
 	help
 	  This selects support for the MOXART SD/MMC Host Controller.
 	  MOXA provides one multi-functional card reader which can
-- 
2.17.1

