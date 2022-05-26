Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E175354AF
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 May 2022 22:41:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8Kbn5nZqz3bl3
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 May 2022 06:41:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=njmUR1Xg;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=njmUR1Xg;
	dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8Kbj6vDZz30QW
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 May 2022 06:41:37 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id q15so3126799edb.11
        for <linux-aspeed@lists.ozlabs.org>; Thu, 26 May 2022 13:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iDU4xBC5nWMNmyCg1ZxLXPk4J0emRkItlM3WQU2JAnA=;
        b=njmUR1XglcBE+JRzoM0q8gmFW5nTrNyW5GkBvAmW48aW5lNqDLKUiJkKeJyy1x020d
         KGucZ+w7ACN9g/i2f2ea68jt6RYW7yUkV+BrvkhA2DzmLVrTr7Z4+1FBdiiKLzh+4XEF
         q+FP5dBGJxACKOw5iEH2HE1S9y/lqskUuAvYsX/GHiO5rd5F5UmB4mASf9ErNDel3+2H
         LMHHjG8ZJzCxDm+Nhc7If0LAgoGhgkY88SGQ5Hih7lVjhIeKtsy95SauXk2c9AQCCU+l
         rZsiSO/L4jpQWNguq1GKmkqUf6NSc6x1TgTLIkPCtsvTvAY48TLYjJ+oH8zan9b6nROK
         A4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iDU4xBC5nWMNmyCg1ZxLXPk4J0emRkItlM3WQU2JAnA=;
        b=R4+rKYXXekyVJFXhb1TW/txHlopTGsyaoyAN/YAL3G6cRaTjqGk6t3w1GoDloXgtqQ
         11uI5Ixh3DlGAkaTvv/ydiWmhDAkS+PT63gqHpb+n87cA5LEXR/7WxTpVI75nmPDdhR0
         Tc7z2rCFsXt8t8RVDfDar8Bof0orVkEqVo0PZtEjRmWQJhy+SUZ7I9awxpuLzVIjzFZT
         XLM8S5YNKmnWRVNdfzN/mH3esRmvWwqjoLLckRk1spGX8JaqTcIrmqcLBhcarSFMIOOY
         W+0WGT29kOveWzY2kAxpV2kQwvsv5OJ3QD4b9UfR4neyfxVuKBY1SfofFJq6EF4KprVc
         T6Mw==
X-Gm-Message-State: AOAM530B31/sDE1EcaB94uYLkkBR+dAPtkj447RcmGzzvPVZwrJGZFIg
	1E3jbaWrkE+FNHttOwtIZxHodA==
X-Google-Smtp-Source: ABdhPJw2cOeuIEGTQNwPOb/HuniCTNdhsvrUqMAxNn50imGeVksbRSzX3nol7SaI2Kgsf0CL2JOy6A==
X-Received: by 2002:a05:6402:1d51:b0:41f:cf6c:35a5 with SMTP id dz17-20020a0564021d5100b0041fcf6c35a5mr42029179edb.25.1653597693596;
        Thu, 26 May 2022 13:41:33 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y11-20020a170906070b00b006fec28bd09fsm815590ejb.22.2022.05.26.13.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:41:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: aspeed: adjust whitespace around '='
Date: Thu, 26 May 2022 22:41:27 +0200
Message-Id: <20220526204127.831853-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts | 6 +++---
 arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts       | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
index 61bc74b423cf..a5e64ccc2b3a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
@@ -24,17 +24,17 @@ memory@80000000 {
 	leds {
 		compatible = "gpio-leds";
 		postcode0 {
-			label="BMC_UP";
+			label = "BMC_UP";
 			gpios = <&gpio ASPEED_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
 			default-state = "on";
 		};
 		postcode1 {
-			label="BMC_HB";
+			label = "BMC_HB";
 			gpios = <&gpio ASPEED_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
 		postcode2 {
-			label="FAULT";
+			label = "FAULT";
 			gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
 		};
 		// postcode3-7 are GPIOH3-H7
diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts
index 69e1bd256271..46cbba6305b8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts
@@ -65,19 +65,19 @@ leds {
 		compatible = "gpio-leds";
 
 		BMC_HEARTBEAT_N {
-			label="BMC_HEARTBEAT_N";
+			label = "BMC_HEARTBEAT_N";
 			gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 		};
 
 		BMC_LED_STATUS_AMBER_N {
-			label="BMC_LED_STATUS_AMBER_N";
+			label = "BMC_LED_STATUS_AMBER_N";
 			gpios = <&gpio0 ASPEED_GPIO(S, 6) GPIO_ACTIVE_LOW>;
 			default-state = "off";
 		};
 
 		FM_ID_LED_N {
-			label="FM_ID_LED_N";
+			label = "FM_ID_LED_N";
 			gpios = <&gpio0 ASPEED_GPIO(B, 5) GPIO_ACTIVE_LOW>;
 			default-state = "off";
 		};
-- 
2.34.1

