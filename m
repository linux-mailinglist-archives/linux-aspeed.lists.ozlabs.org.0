Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2259D957916
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHv0rCYz3g4y
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O/A1HWzh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VH4cV6n4Rz3vhk
	for <linux-aspeed@lists.ozlabs.org>; Sun, 14 Apr 2024 06:22:50 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-56fffb1d14bso2661320a12.1
        for <linux-aspeed@lists.ozlabs.org>; Sat, 13 Apr 2024 13:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713039766; x=1713644566; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlncqStkvETVCUs6zj718afM59TCNUlcR1fhhEtKfCE=;
        b=O/A1HWzhtsiYBFyi6nYb6qRfsQOxMyFe+CEJG1FyJ8LBQuVFP2ZFo9hUNCGNNaW7Zx
         Hvbx9gySJMFWwK4fpl77foluMtz/ryzVAWJmU5NoyxFS42d8ot+TQrtOR54jxOyVRfgy
         vMipYu1KWbRu81KxrFUDCBaqjEdr7ABqb83ldxi80VaKVLl/xehOyw4UyMFBWufJetOb
         IJavlzhlSdzftuZLGNqpgXrMbMkWxkUJ9hzsKqbCF8uhjQpxaUFN12cbcDMYYwpd8WCV
         mlPHXoFihGieEffWTbOLJlL6kvtvRBtVhtGVJMbtTnT/36wRsYnAzXzxgfqNj8kwexp9
         Hydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713039766; x=1713644566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mlncqStkvETVCUs6zj718afM59TCNUlcR1fhhEtKfCE=;
        b=nDLR2hPQE0eotgGnmtN49wPvHZbBNxA7UmakOpJFWf1m1fS2dPywuynIF40gvqMFQ2
         VOrOPCwIo23sDfY2ei6tePCvpI6FAgViHTonrcBQC6nk+tBVDCTQPU5IQvvRj7r/Ng1T
         QXhn2yYDmFPp6RQhNZxmOEATasg2YlLpmhkFXNmRTF3cLvRZbV/JJAiDfLc2uYXh+Yq1
         iOsNUG9PCqszWoEw/VD7sNIQ1u7Ngspd8XKVsUL7PGLkgBRXWkYSfHp6npK2dXeknYDJ
         +suhr2R3epuNgmf3PH2lqVc0jEaeZr/ixNdKrM3d0OsEUtkieWJNGkDCHArDaYRtY56X
         fkZg==
X-Forwarded-Encrypted: i=1; AJvYcCXezOIRFXlt4esrV+Afubu/qa6GpPCHn5jqdSbtl4tj93Y5+dEmnJdbGpG/qwqMSk4JCuT78j02o1yXA6wQgIZQhbqsrLgQfTe0Dh/sOA==
X-Gm-Message-State: AOJu0YzXAqjRMwx7KZSAMchmRhRkaeZ6j92gE0i0Zi4kF/agj6+CThMy
	HY5kvo6DkPDKqIcV0Kb8AIMQ9fn3J5Bhq7LRlscLUX2zA1B97SPo
X-Google-Smtp-Source: AGHT+IFxJMdB4pyARx3Aawi3IFzs2nXj+ryWbAKjAxJvsPXVxaHcoc6IA0BRjiO7OEU63KcFBwK6Vg==
X-Received: by 2002:a05:6402:2483:b0:56f:e7fe:6416 with SMTP id q3-20020a056402248300b0056fe7fe6416mr7532268eda.5.1713039766540;
        Sat, 13 Apr 2024 13:22:46 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-64.cable.dynamic.surfer.at. [84.115.213.64])
        by smtp.gmail.com with ESMTPSA id f16-20020a056402161000b0056e2f1d9152sm2881222edv.93.2024.04.13.13.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 13:22:46 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sat, 13 Apr 2024 22:22:16 +0200
Subject: [PATCH v3 1/4] arm: dts: nxp: lpc: lpc32xx: drop 'clocks' form rtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240413-rtc_dtschema-v3-1-eff368bcc471@gmail.com>
References: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
In-Reply-To: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713039763; l=881;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Q2/PcLOdGvifsb0OrilHhlY/IiPhNM4DytJOdAt+KtY=;
 b=vW9T9O08KRg4Tk31a33U5au8ur+G1CxQM5yQmbHVaTcG7YJwzkC5L6cslsx1y2Cb6oKXWEHMV
 4EKBRC1ug7EBOBJOMAYRJc1q9ceXcMmj0g12hxQk14EElmgr3JwLwzl
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The RTC does not provide a controllable clock signal (it uses a fixed
32768 Hz crystal, the input clock of the SoC). Remove the 'clocks'
property to better describe the device and avoid errors when checking
the dts against the nxp,lpc3220-rtc binding.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 974410918f35..f78d67e672b4 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -384,7 +384,6 @@ rtc: rtc@40024000 {
 				reg = <0x40024000 0x1000>;
 				interrupt-parent = <&sic1>;
 				interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk LPC32XX_CLK_RTC>;
 			};
 
 			gpio: gpio@40028000 {

-- 
2.40.1

