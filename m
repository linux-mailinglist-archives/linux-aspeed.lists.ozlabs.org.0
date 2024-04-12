Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEF68A2ADC
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 11:19:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dz80WDyM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG9x34px1z3vfP
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 19:19:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dz80WDyM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG9wW5pw3z3vcw
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 19:18:35 +1000 (AEST)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5aa3af24775so511097eaf.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 02:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913514; x=1713518314; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbzylmHYr/j6rcbPvQmFegZHyso6L6GQACssFL429cI=;
        b=dz80WDyMoN7jonXknnY0BlwZ6/+X+jTjLz9lTwm0LbWf6NU+1MN/dV+uQDMRJMhEFX
         +H25aFzHCqUfc6NL8yittwaPXcWoboLDe5BBUHAy47pgRoMPeT52aGpuv8phs9R4Pgj6
         rwb5x/P2h4XhvV41ZXt4VE38bu2KGdn5exDU+GwjInQTmcRdYh126R/FQKfXgLwpuWGz
         H7xPeWyUNSRrDttWRCN4z5U5Y2xTJK5/YV/L42BtmskMMrIRSyxGcSoHIuIy4xOcEZLg
         3mHihi2TrF8s975fSJZfPYhbSAawvhzCM1FSPxPqGT0pWK82X04Q6n53j7RyX20KpxmS
         Xcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913514; x=1713518314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbzylmHYr/j6rcbPvQmFegZHyso6L6GQACssFL429cI=;
        b=qqqBFJ8ZMARXQWhA5K/tsUcRiPBZFFmV5af4RmI7IfFJjtVkraNKP//C77XRJgUwtY
         Ga2lW2KhUFGsiWqi9SojTuaS0KSdArVPY1ul4XFtLkMSzcQG30YpU837KY8ihvxcxU9h
         YJaN1OZD+O0Yl+YlLLASvzBnhLZ5Fk6BBdeHkVx4IgRffJPzcnPZ2SFHbq4mdlx/b51G
         YFq1AztIgAF518FFEZOIc+2HgoquveYd+QSVEhuJIM0e+uBwp4PSjW9Bj/VCdyFWe/mn
         zyMnvgGo3klfpf7cpfnMl/WBMSwIqbMd9z98KMzMIFpUv4gwJTdRmaUIVopqhVOMI0lW
         ai3g==
X-Forwarded-Encrypted: i=1; AJvYcCXt+ULOI6u9WwlLFDxX8XcqdabU6f4k4PasNUKNjmgTiJ/+CRDyJjgOSqKFB7LT82uVXcbFDOLuoqPnAQf/3h6M/tCASy7ln5j3JTd/3w==
X-Gm-Message-State: AOJu0YypjAqYFy1K+hHSBlxar0VapnA1GNuzzSKGFGxIxePXo6S+TCfa
	Ju0PK7hp8NNTV97K5YiBYDXyEB+mLMQ01m9xPSCotfVV1bEAoASd
X-Google-Smtp-Source: AGHT+IFWGE2vq47FAJJHlYYA8HHa90TSGrKT67/8QPdfpzKIGVVQrsZP918bQFRgm9c5uYKokTBswQ==
X-Received: by 2002:a05:6358:9814:b0:186:1d2a:a457 with SMTP id y20-20020a056358981400b001861d2aa457mr2258466rwa.15.1712913513786;
        Fri, 12 Apr 2024 02:18:33 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id b25-20020a63a119000000b005e840ad9aaesm2332711pgf.30.2024.04.12.02.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:18:33 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 11/12] ARM: dts: aspeed: Harma: Add retimer device
Date: Fri, 12 Apr 2024 17:15:59 +0800
Message-Id: <20240412091600.2534693-12-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412091600.2534693-1-peteryin.openbmc@gmail.com>
References: <20240412091600.2534693-1-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add pt5161l device in i2c bus12 and bus21.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 530f69005857..a5abb16e5d8b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -250,6 +250,10 @@ imux21: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+			retimer@24 {
+				compatible = "asteralabs,pt5161l";
+				reg = <0x24>;
+			};
 		};
 	};
 };
@@ -370,6 +374,10 @@ &i2c11 {
 
 &i2c12 {
 	status = "okay";
+	retimer@24 {
+		compatible = "asteralabs,pt5161l";
+		reg = <0x24>;
+	};
 };
 
 &i2c13 {
-- 
2.25.1

