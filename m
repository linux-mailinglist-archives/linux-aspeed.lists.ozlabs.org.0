Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9EE86864F
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 02:48:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EkH7Pt3v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkL3P1Bg0z3dXM
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 12:48:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EkH7Pt3v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkL332wFKz3d39
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 12:47:43 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1dca8b86ee7so12551285ad.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Feb 2024 17:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708998462; x=1709603262; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eE+ArNThktHqxq53xyc4RaWaWv+q0sBFJ+ThRmH5j0U=;
        b=EkH7Pt3vWiDDl08M42oPkQQA+hU6oFclwUyeRsEy0Q4WjXXlayqxvngrWrxrDtS9hA
         9fwzlvbsZBY0ig/vev+KrpoIrMDiGKo4LzrDoKr+iRix29l/hoXyxrrUSxHAVveC9cGE
         bNS+CmGk7gTpdGItnsvZh8ZsFoWupWE0ShskJtvgeJMFNJsk0eCBeFpkQY4ixSiCCOuW
         9cYyQ5XDSeAYvLcSK88z9xFiPKYeaKx7PXo/KxnSEeKhEw9VH+5j3rnRfZ7ic6JVjSFH
         AhQZ72daT7UiTbptSVa3k67l/o64JJ+Y0zyVRrxuXKhH+bTk03FXPvt3q8UwKcoxjb8e
         86Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998462; x=1709603262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eE+ArNThktHqxq53xyc4RaWaWv+q0sBFJ+ThRmH5j0U=;
        b=nY+Q4xu4UKhjM6LhBIDprGPxk9FLzSH89TEi5M/F8hk6QqB21PNUyTa7LlMg7oPMBM
         kbU/Hl4ZVMeUtjJ2V4hNcyI80siEbp1KdtDdlrRchBaebvaYntAvZGBx2r7OQpYZsDzH
         72uu8CDvPoh5SSD18WbdAYktvYjhIMOsjWAzXMwvs2DWV36YuJXnR4yfMiV/Yz3k4nHy
         HRO+hucR816DxzXnajYTeiSnAcI6riJE/dXoxIrJ891U3gBRv8umFBt5AYAEWzLdOzcz
         qsAW2QuMy0W1rE9I4TL215C6EjMdD47yhe0FPvisnlle24gDz6N9DbgCiNFphr4agnK1
         gtoA==
X-Forwarded-Encrypted: i=1; AJvYcCW8gJgHhIZfsl49KGHxH92e+/K9cXPPjDeP/9IxDZAFG6C2D6YGvjW1AJ1NriVHv2H6sfCpl2C1S/8fJCaHeux9Uke1dmVS6FghDiQZMA==
X-Gm-Message-State: AOJu0YxfvpOQuLRqzPQeKXLgUj0Fk4mAn3wfMIVz5lCQiPmE0qdpXUlx
	G33osFM8R6F4FR4JVtjwav1IpRi5h9maV9lTZAumaK9aEn1O59st
X-Google-Smtp-Source: AGHT+IGUkrUYzuWekhnfwHEaJElaB5YlO8KX43Tz0JCPBvqLuayKsT3ekwmZgSKD3IxpMHae2CmDbg==
X-Received: by 2002:a17:902:6e10:b0:1dc:6152:7c24 with SMTP id u16-20020a1709026e1000b001dc61527c24mr6961774plk.43.1708998461762;
        Mon, 26 Feb 2024 17:47:41 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e381-af24-f369-7cbc-56bf-1d54.emome-ip6.hinet.net. [2001:b400:e381:af24:f369:7cbc:56bf:1d54])
        by smtp.gmail.com with ESMTPSA id kl14-20020a170903074e00b001db4b3769f6sm318893plb.280.2024.02.26.17.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:47:41 -0800 (PST)
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
Subject: [PATCH v4 06/10] ARM: dts: aspeed: Harma: Add PDB temperature
Date: Tue, 27 Feb 2024 09:47:15 +0800
Message-Id: <20240227014719.3037588-7-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
References: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
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
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index ca3052cce0e0..5c3fa8bbaced 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -203,7 +203,7 @@ max31790@30{
 &i2c1 {
 	status = "okay";
 
-	tmp75@4b {
+	temperature-sensor@4b {
 		compatible = "ti,tmp75";
 		reg = <0x4b>;
 	};
@@ -260,6 +260,11 @@ delta_brick@69 {
 		compatible = "pmbus";
 		reg = <0x69>;
 	};
+
+	temperature-sensor@49 {
+		compatible = "ti,tmp75";
+		reg = <0x49>;
+	};
 };
 
 &i2c5 {
-- 
2.25.1

