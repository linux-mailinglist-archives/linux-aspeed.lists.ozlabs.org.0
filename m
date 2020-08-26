Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F0225285D
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Aug 2020 09:19:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bby124y6kzDqX6
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Aug 2020 17:19:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OXa+dODJ; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bby0p5HwjzDqWY
 for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Aug 2020 17:19:38 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id g33so605579pgb.4
 for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Aug 2020 00:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qWLQ09H4pd8WgMgtgz12mw5W3VvW3dhG530iJhOXSE0=;
 b=OXa+dODJtUqYwtqpQ7ayh7hD2+7v70th2/273W1+fTk2MmqVr26N7l3YZK+gVNeD/0
 VJQGWHjYBPCccKWZ5YVAYwN/9y4ZFAyd6xLhPT4v16Qzl8uLtYEwJYFtwS+IV2T+uYRT
 o696chC8iVjFQ0LJSsUiv6kscF9IHSXTtAA+LZaM69XQXkCOHKmEW0qVuTAVoGDTw8rI
 sKBmyMC1a5Rt7wlCJz+Qs7XI8L/DKlv4IH8jFR3MVib6BMPkEUCTjfEyquqWtlz1cbbZ
 Ja4CpU7sVeu/8jGj2Wbeme+jeEiCa6g/jBznhIWVa5JLTjmtiBQR2a5mNhXgh2O5GvYc
 AUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=qWLQ09H4pd8WgMgtgz12mw5W3VvW3dhG530iJhOXSE0=;
 b=HVnnDBVj1ul8YytMAxggz6f1Kjuy15gRf4crVa/mTy5VN2DM4anvKnmz/hvGzYBZNx
 3VD/CWtOHwxMLK67tHxb6e6ybnE3BVCZXHHGKfkAMinTfIAm7VJXqoxFfydiFxjyU/Bq
 JaqVf3Enibt25FULPN++3QNu9A/hLMsZ7AVyuTrcfhZC8//U0Rx3eRIqX3ODqtnlVkY8
 yS5gOEXWciqn6cJIgUht5pX+AR6iA+3L2neLKeh7X673+kiPj0U5HC330xQwL49HEucU
 eKOXwQvLBwkebOvqMZDxkM9PKfCgKhmqOub7ereKvBtvYfivJKWFCiZfyc2UEL5UmlBH
 VdJQ==
X-Gm-Message-State: AOAM530QA6udU/AdmN6AIWqrKZtbn5HURGHa2f3ZFwamZGaObi22cZm4
 1q9mt/sXwy5qxCDzBo9lEbE=
X-Google-Smtp-Source: ABdhPJzu+RfzmpakKaJ6ICWRJIIn4iAY6rm05Qjiy2cIfh8eZg7ri+t6ytJ/DqHxJh9T+iOIaATKGQ==
X-Received: by 2002:a62:1c86:: with SMTP id c128mr11084787pfc.78.1598426374880; 
 Wed, 26 Aug 2020 00:19:34 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id mw8sm1125465pjb.47.2020.08.26.00.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 00:19:33 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH] ARM: config: aspeed: Fix selection of media drivers
Date: Wed, 26 Aug 2020 16:49:16 +0930
Message-Id: <20200826071916.3081953-1-joel@jms.id.au>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Tony Lindgren <tony@atomide.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-mips@vger.kernel.org,
 James Hartley <james.hartley@sondrel.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

In the 5.7 merge window the media kconfig was restructued. For most
platforms these changes set CONFIG_MEDIA_SUPPORT_FILTER=y which keeps
unwanted drivers disabled.

The exception is if a config sets EMBEDDED or EXPERT (see b0cd4fb27665).
In that case the filter is set to =n, causing a bunch of DVB tuner drivers
(MEDIA_TUNER_*) to be accidentally enabled. This was noticed as it blew
out the build time for the Aspeed defconfigs.

Enabling the filter means the Aspeed config also needs to set
CONFIG_MEDIA_PLATFORM_SUPPORT=y in order to have the CONFIG_VIDEO_ASPEED
driver enabled.

Fixes: 06b93644f4d1 ("media: Kconfig: add an option to filter in/out platform drivers")
Fixes: b0cd4fb27665 ("media: Kconfig: on !EMBEDDED && !EXPERT, enable driver filtering")
Cc: stable@vger.kernel.org
CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---

Another solution would be to revert b0cd4fb27665 ("media: Kconfig: on
!EMBEDDED && !EXPERT, enable driver filtering"). I assume this was done
to be helpful, but in practice it has enabled the TUNER drivers (and
others) for the following configs that didn't have them before:

$ git grep -lE "(CONFIG_EXPERT|CONFIG_EMBEDDED)"  arch/*/configs/ | xargs grep -l MEDIA_SUPPORT
arch/arm/configs/aspeed_g4_defconfig
arch/arm/configs/aspeed_g5_defconfig
arch/arm/configs/at91_dt_defconfig
arch/arm/configs/bcm2835_defconfig
arch/arm/configs/davinci_all_defconfig
arch/arm/configs/ezx_defconfig
arch/arm/configs/imote2_defconfig
arch/arm/configs/imx_v4_v5_defconfig
arch/arm/configs/imx_v6_v7_defconfig
arch/arm/configs/milbeaut_m10v_defconfig
arch/arm/configs/multi_v7_defconfig
arch/arm/configs/omap2plus_defconfig
arch/arm/configs/pxa_defconfig
arch/arm/configs/qcom_defconfig
arch/arm/configs/sama5_defconfig
arch/arm/configs/tegra_defconfig
arch/mips/configs/ci20_defconfig
arch/mips/configs/lemote2f_defconfig
arch/mips/configs/loongson3_defconfig
arch/mips/configs/pistachio_defconfig

I've cc'd the maintainers of these defconfigs so they are aware.

---
 arch/arm/configs/aspeed_g4_defconfig | 3 ++-
 arch/arm/configs/aspeed_g5_defconfig | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index 303f75a3baec..58d293b63581 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -160,7 +160,8 @@ CONFIG_SENSORS_TMP421=y
 CONFIG_SENSORS_W83773G=y
 CONFIG_WATCHDOG_SYSFS=y
 CONFIG_MEDIA_SUPPORT=y
-CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_MEDIA_SUPPORT_FILTER=y
+CONFIG_MEDIA_PLATFORM_SUPPORT=y
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_ASPEED=y
 CONFIG_DRM=y
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index b0d056d49abe..cc2449ed6e6d 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -175,7 +175,8 @@ CONFIG_SENSORS_TMP421=y
 CONFIG_SENSORS_W83773G=y
 CONFIG_WATCHDOG_SYSFS=y
 CONFIG_MEDIA_SUPPORT=y
-CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_MEDIA_SUPPORT_FILTER=y
+CONFIG_MEDIA_PLATFORM_SUPPORT=y
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_ASPEED=y
 CONFIG_DRM=y
-- 
2.28.0

