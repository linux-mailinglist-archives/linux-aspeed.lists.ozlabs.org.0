Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0208B8300DA
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Jan 2024 08:56:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dZwQG/Uc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TFJ9l5Z4Wz3bqQ
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Jan 2024 18:56:43 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dZwQG/Uc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TFJ9X01RYz2yVR
	for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Jan 2024 18:56:31 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5578485fc0eso10033870a12.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Jan 2024 23:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705478188; x=1706082988; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XwkSEcICpe+ea0RQFV2DwhY0p5bgvvp7tE8xUKgZWE=;
        b=dZwQG/UcWDDzxksdRA4zB2DSKbwQ1ZCSago9RLxpaibCx6VFdG8Jt5Vx1lX/TDbX+p
         CEeiz667F3pRMdkUP0Cqf33MVRO24T+WogD4j0VtEdl+5b/1JHsz6bN97x4hvDqe/nDI
         6PR80hy4tyXjR4uuo8pVshqlCKeFhDX5w5ygzJGreMQ8G4BfWfVTV1nFgCIN9tCVNLeK
         2Mu9WDBynhILFcQQif4MbJPIfIZUVYQaRfA/zmha99wfFMdrDiDxE/EIzxreN5BlKJ8J
         bG/HqssrbS17AlLHvwVinR+QH8LOyN71vp37iSvMR5tNvbGnTMyJqkYRWEYtyIlWT/1M
         W0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705478188; x=1706082988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XwkSEcICpe+ea0RQFV2DwhY0p5bgvvp7tE8xUKgZWE=;
        b=Llf75+PVMaDCe7yjb0XICYkoL/xaQ71BKLdiftIZ87ogmmKMIRa+jkoWVEBuzrnwkS
         bdwIc/men5c6uPKMR1u+GAN3VP2Frk+xylmVP3+aaAL3sh25TaPByA5cUeARqj1rqjNF
         vu9Wu1bB25BRcG7B4Ph9d7y3RhY4DvEU3kPggVq1iTDS4ZViEvMGy5w/6HdohZD1rdOg
         g+joIOwvbiNbMU/WVU+QkfWM2E0gS5pP6CcaRDcu78vySdGgIJLKGmdRA3duYumAxrCN
         4azqSJ9bpgbYOR3yuji6v/Us+OsZVUY37Qm5RpcDzctfZ9OfapUlG4Cb4/Kxf5UVAbiJ
         6P4w==
X-Gm-Message-State: AOJu0YyENVyB3+bEG49GDR/phX4pCVlBDeVBh7AMj1uJyVQadIHziyt1
	/9Qv8zRpIUdwiZ8M8PpB7ipCC7Po3JtiUw==
X-Google-Smtp-Source: AGHT+IHkw9HZFsdb6DKFrLoeYbHMisIsEIxTQf5ZInpVZB2TZbqsfkwq85KIqoqU8GUl2wPwxTB3zQ==
X-Received: by 2002:aa7:d589:0:b0:559:ba2a:68ce with SMTP id r9-20020aa7d589000000b00559ba2a68cemr928382edq.41.1705478187767;
        Tue, 16 Jan 2024 23:56:27 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id fg7-20020a056402548700b005593c83bdafsm3911729edb.45.2024.01.16.23.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 23:56:27 -0800 (PST)
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
Subject: [PATCH 3/3] arm64: dts: intel: agilex5: drop "master" I3C node name suffix
Date: Wed, 17 Jan 2024 08:56:18 +0100
Message-Id: <20240117075618.81932-3-krzysztof.kozlowski@linaro.org>
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
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index d66d425e45b7..1162978329c1 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -202,7 +202,7 @@ i2c4: i2c@10c02c00 {
 			status = "disabled";
 		};
 
-		i3c0: i3c-master@10da0000 {
+		i3c0: i3c@10da0000 {
 			compatible = "snps,dw-i3c-master-1.00a";
 			reg = <0x10da0000 0x1000>;
 			#address-cells = <3>;
@@ -212,7 +212,7 @@ i3c0: i3c-master@10da0000 {
 			status = "disabled";
 		};
 
-		i3c1: i3c-master@10da1000 {
+		i3c1: i3c@10da1000 {
 			compatible = "snps,dw-i3c-master-1.00a";
 			reg = <0x10da1000 0x1000>;
 			#address-cells = <3>;
-- 
2.34.1

