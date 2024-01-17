Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCC98300DD
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Jan 2024 08:56:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JkDjU3Qz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TFJ9w5hZ7z3bdV
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Jan 2024 18:56:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JkDjU3Qz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TFJ9X0Ynnz307V
	for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Jan 2024 18:56:30 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50ea9daac4cso11221283e87.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Jan 2024 23:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705478185; x=1706082985; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1ikojdbGs7xDo7niT+1oLSnQGCDtDxb/MkgvOzMnfQ=;
        b=JkDjU3Qzf3r74WHrHGPYIS6cKaubiLnDESFi7tLHVZSq+2IVBjGWPUxEh0F7rIuPNd
         waFMF+rpejKyr9MMhRWfo1dDKvG5Yxl9I+tkPsFbPcm/IHbk0nfngJNzaRphT6fAMnNE
         71oA1TyzW1oMZyZ6PcsC7t9I6kgIgxK6SfT6Z2vb0O+8X8xEWmnOOd2qAjIkDcgZsHyr
         wTzjFYMWZ58TXE6UDBVkjezQzDkBzghf32ztKzc88p9q9vRQoGiEZq/O7ZX54+E4VM61
         wj6qqRl3M3KlT/4BrtMOeuje4MRDi9vSVX+FAbfexBlC0X2hbJi1uB/WGMY+qoYZqhEx
         zMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705478185; x=1706082985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1ikojdbGs7xDo7niT+1oLSnQGCDtDxb/MkgvOzMnfQ=;
        b=l9mxqNU4OBvMf9mUBqgCVOpMsjK5HL38Yz5vKe09YLYgg/pAnV1HHN7CIrVaofJKcJ
         NtcRKYUuMsTwiP5DpGvy1a1R7zwmjWLgLNKxgQmmc3/b66yGNBMSfYFNYsE8ESf7w0Yp
         Y/Kw6TQsGc2BCmANH7i5qIDU7FW9zgPhcV8GBcIZ6V34wYuUbJlL1HcUO3HBI+JGyp32
         eRgD+Rx0WCY0AN3DJ28BBgxdzrBqRrm8FYNRNMWcYPQMBirfC5YHYAQZ8DYF0oW/UUEg
         vdOBvLi8jTwOx0qvQVhWDuoVzK5vqiQhJCFbbO41I0nTctxZLovTXkD2SovJn5nRAhg+
         DCbg==
X-Gm-Message-State: AOJu0Yx8r+q1THuqJmfuNosb3GaQjrNnzl6h+5ZZgaFqeFIhGZ2CrX2f
	zcc8LFXPQ1D6dEZSehydJV2eBRLRm3iVYw==
X-Google-Smtp-Source: AGHT+IH1lZmQtaAndRJ+LXGucJE38oBaOnStf0fj+tk7FqnFGzgsPeytlARYdgzXocquwH2AHk6E9w==
X-Received: by 2002:a05:6512:e91:b0:50e:7fd9:11 with SMTP id bi17-20020a0565120e9100b0050e7fd90011mr4391489lfb.83.1705478185190;
        Tue, 16 Jan 2024 23:56:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id fg7-20020a056402548700b005593c83bdafsm3911729edb.45.2024.01.16.23.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 23:56:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Nicolas Pitre <npitre@baylibre.com>,
	linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: imx93: drop "master" I3C node name suffix
Date: Wed, 17 Jan 2024 08:56:17 +0100
Message-Id: <20240117075618.81932-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
References: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
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

Following change in the I3C bindings, the "master" suffix in I3C
controller node name is discouraged (it is "controller" now) and not
accurate (if device supports also target mode).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

The change can be applied through independent trees, if the I3C bindings
change is applied.  Therefore please take it once I3C bindings is
applied.
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 8f2e7c42ad6e..601c94e1fac8 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -294,7 +294,7 @@ tpm2: pwm@44320000 {
 				status = "disabled";
 			};
 
-			i3c1: i3c-master@44330000 {
+			i3c1: i3c@44330000 {
 				compatible = "silvaco,i3c-master-v1";
 				reg = <0x44330000 0x10000>;
 				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
@@ -671,7 +671,7 @@ tpm6: pwm@42510000 {
 				status = "disabled";
 			};
 
-			i3c2: i3c-master@42520000 {
+			i3c2: i3c@42520000 {
 				compatible = "silvaco,i3c-master-v1";
 				reg = <0x42520000 0x10000>;
 				interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1

