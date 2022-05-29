Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E4E5370B5
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 13:14:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9wtR4hK1z3bl2
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 21:14:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rhxV0Z1V;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rhxV0Z1V;
	dkim-atps=neutral
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9wtK6t42z2ync
	for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 21:14:49 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id f21so16009508ejh.11
        for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 04:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rGhstKLsyi2KJ+CtRUGYDx9gAOcoBt1ORpXxBhyJ8eY=;
        b=rhxV0Z1V3zfgBPgVVe7tv/AAiK+DBDDaEkHv94ZUbrB648F2ZB3DSr5iKqOPw2ro1H
         MQx7LFkJXU6LnLfrt9CyoIo74GtkJgmQuYUheoxin73O52csTjjQEjal86Qe5UCVPnN6
         qh/eA6sZZ7gIGVFKb/WWM4zFkdpZIXtCXIlM9D0VeQRmwaC1bVm2MiPXzVajeuFn6g0I
         jjKCWfaElOuqCfu3RxCbdXPToPZrfEg3LfGHgbRhmaWhoWwTJhjsrHWWcQ/15jNbPmIj
         rsOWAupXYfk2YQErqdnu90NRds7ejSw55TZKFkpDPggXqxxWuShcoqa1Cxculjw89YYc
         u54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rGhstKLsyi2KJ+CtRUGYDx9gAOcoBt1ORpXxBhyJ8eY=;
        b=oQTssHZSdE0dyFadsSYUNNMT1hRSXzIZLhQX5pcSB8zi6BuRLZR9XgzwCtHnFJqB6j
         lU5NpvRlzabnPye8mYT2w1mPizgsjYR+Y5aTL6G0S2L+K0WyyiqK0tq4bKlScbmdUBCC
         G3wCmgXbMjtwg6zNUAOaiHaHjebI4gnj+BEByaI0TayjITUy4dor8cPhkRakIfoPlPFY
         XSdAkMPfGmC84ocCnNsia7qvNC9LfqS2g4XOXsYH8Uu+P3+6AOX8avYX+3rKxTnHZ2PZ
         fZv1kvPr2XdxYkC2353496F7569tJNNfHDtRRooh11h3juVIT/FW2qLD1Ae0qfjHRn5l
         n09Q==
X-Gm-Message-State: AOAM530V8j0jjYS9DeRwqoosqzKAJpXiZHLKoO5O+O4hgPtfpHfGPclc
	lqGjUox29ndd/1yANlmyN631Xw==
X-Google-Smtp-Source: ABdhPJwqfJO8L/+sv/ODyACstbNznQsCsqUfk45ZMaUmJejvzc8E1H5Mro8SHweV6EA3FC1iq9ujKg==
X-Received: by 2002:a17:907:9805:b0:6fe:c719:f45d with SMTP id ji5-20020a170907980500b006fec719f45dmr31475165ejc.43.1653822885846;
        Sun, 29 May 2022 04:14:45 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hp17-20020a1709073e1100b006fecb577060sm3086313ejc.119.2022.05.29.04.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 04:14:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: aspeed: vegman: drop unused fttmr010,pwm-outputs property
Date: Sun, 29 May 2022 13:14:42 +0200
Message-Id: <20220529111442.182722-1-krzysztof.kozlowski@linaro.org>
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

The "fttmr010,pwm-outputs" property is neither documented, nor used in
Linux kernel driver, so remove it.  This also fixes warning like:

  aspeed-bmc-vegman-n110.dtb: timer@1e782000: 'fttmr010,pwm-outputs' does not match any of the regexes:

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/aspeed-bmc-vegman.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-vegman.dtsi b/arch/arm/boot/dts/aspeed-bmc-vegman.dtsi
index 1a5b25b2ea29..43af63910571 100644
--- a/arch/arm/boot/dts/aspeed-bmc-vegman.dtsi
+++ b/arch/arm/boot/dts/aspeed-bmc-vegman.dtsi
@@ -166,7 +166,6 @@ &sdhci1 {
 };
 
 &timer {
-	fttmr010,pwm-outputs = <5>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_timer5_default>;
 	#pwm-cells = <3>;
-- 
2.34.1

