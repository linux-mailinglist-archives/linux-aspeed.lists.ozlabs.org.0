Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C048242FD
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Jan 2024 14:48:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NRw+qthg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5SbL24Qvz3cVs
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Jan 2024 00:48:14 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NRw+qthg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5SZy42hZz3cVl
	for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Jan 2024 00:47:54 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d3e84fded7so3321135ad.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Jan 2024 05:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704376072; x=1704980872; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yp8IfCHTatW0ncFNjRQTUbnECiIcWKU3D3cZUARMrCo=;
        b=NRw+qthgsREYERHkkfqw3ARgGTB+RUSpd/2mWC2a+SvjK0yq3a44qBHUqLACx0gWmZ
         cJ1zWtiqTn/DCU6Dx901R8MamVGWmIVFEilmO36e7M9V+2Id1kS473sR0Y/kJ794utQn
         whdBjfn6nqQ7JmGBCKlNCS0dpNKM+wNY81NN47fUJXykthCA8dUVKtmV4+wcSz1NjInr
         /M3r8ukBYyHgM4P7xol+n2TqYUKWELmzanXK5HvvM4NbSCNgTotKCAidOI8sEXShTOaW
         CjGoiO1sG1yc9gww6ahObfkPkQCxfYb8KW/zBCb6I4VjHMwC2ExRf97h8jcRgvXRI2z3
         C6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704376072; x=1704980872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yp8IfCHTatW0ncFNjRQTUbnECiIcWKU3D3cZUARMrCo=;
        b=iy15xoGK9fuM48/yYozlFiTe9n7CYlkpNFTUsftpJ47TK8qHKclqqtqrm3RQ7Fdrq4
         01ccq/EoBy7rRbbTwNADuEPvFBO7wyEAIS44tDX7KF6fHNGeWzVlLmJe02sua2gDhdBv
         5iipl1dgSc4Tcx1wLkN5UaMXnqSDjj0MCLLDiYNf49bWNGQHrkWLLVnt592dBGlsrCPh
         eu9ZZEnW9jHatA6BVUqRqTbjc1S9gAcjTpn5rKt5iGZrzy56apK2cM2VNjY4D85zETMx
         Ffa4HmUgEfwQ8kKfZxPIkzjd9BAagcabbSqBOA/5x2ALNCwdIeZDbDOdv5fJ2+yJROI4
         GnSg==
X-Gm-Message-State: AOJu0YyZZkC89v9Shqw3294zqD8NMnVnTVMHFL/txJkCYUn603agZasj
	feCWdmbjaJFc6C9G0MS1uyg=
X-Google-Smtp-Source: AGHT+IFQHHYmwet3CoyyX/LqgEYVSersCYJ0/Vp/D600j6Qa7Pxw2BNU534S67X/82jEKX0M7gmpsw==
X-Received: by 2002:a17:902:76c6:b0:1d4:3795:710f with SMTP id j6-20020a17090276c600b001d43795710fmr475758plt.135.1704376072280;
        Thu, 04 Jan 2024 05:47:52 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id a22-20020a1709027d9600b001d425d495c9sm22990550plm.190.2024.01.04.05.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 05:47:51 -0800 (PST)
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
Subject: [PATCH v2 6/6] ARM: dts: aspeed: Harma: Add PDB temperature
Date: Thu,  4 Jan 2024 21:45:32 +0800
Message-Id: <20240104134532.536793-7-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240104134532.536793-1-peteryin.openbmc@gmail.com>
References: <20240104134532.536793-1-peteryin.openbmc@gmail.com>
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

Add PDB temperature sensor.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index ca3052cce0e0..4d5d1c822fa3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -260,6 +260,11 @@ delta_brick@69 {
 		compatible = "pmbus";
 		reg = <0x69>;
 	};
+
+	tmp75@49 {
+		compatible = "ti,tmp75";
+		reg = <0x49>;
+	};
 };
 
 &i2c5 {
-- 
2.25.1

