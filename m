Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F6D85D3E9
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 10:42:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nAut4NSe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfrs91tqWz3d32
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 20:42:05 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nAut4NSe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfrrp6BcFz3ccV
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 20:41:46 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6e332bc65b3so2089214b3a.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 01:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708508504; x=1709113304; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yp8IfCHTatW0ncFNjRQTUbnECiIcWKU3D3cZUARMrCo=;
        b=nAut4NSeM+b0j5/tOmBy0FqiRkl7unkuEQwAIX8/xVitXLFMPCahbkWZlZnPB1bGDr
         J4g254cQzcKdWw9hBXsbTqH8TarLGedFN/EeNV77Nu1rwL1BPlQd+zCNSFvlzGgkmkUv
         nx92oMnb2gMZuA/FLNMF9eg9WNsUefldtGRDJGvuUVvn0XoDzieCJO++vdlG1aoSujZ3
         LAqr99fK6DuuMijM1RA/0Q7E1uDc4o9UeHhY5jrS1ZK+WjxAvfhO4MXrR2ez8HJUcMq/
         gqAjY0AKkvJlm6pI2TbstZhnd65R0EV+kfFlsDze/W7o5Eqte6STK+lqXngtGxnvuuYw
         fH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708508504; x=1709113304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yp8IfCHTatW0ncFNjRQTUbnECiIcWKU3D3cZUARMrCo=;
        b=AwMgxUpnJ55eFm5nOQ8EShVpWCnx1sZ/BALr8C2VFOsxg/mGj8mDQkLy+EJiAMQw49
         De48dk1Voa9jUFcDUl+ImsGPQohJlgaiocvPKv+9jZUESi6XFCPwfds3Zggr6JqeyIJL
         3YUhXd7hTmP/JiYiQrbfYKsKYSyVy/8jfwYIFb0J405cZCsTGJ1RoSbTRdAkpRR9nudK
         G1iQE2CabH8VC0m+78pGDvxrAwO8AIZx+fz/uiDDMbgu4IQf+Viee0u/Nq+97vGy1KSe
         eH52td2IY66ZbqeFOuNDWquzu0wJt2zlR8sCgo011Na+ophHjOLDPH3TOISUjhXJpI8a
         gCxg==
X-Forwarded-Encrypted: i=1; AJvYcCUftqtNP8zm0cgF3IS5nN5owFkpNXE61TibRXK+XhStKizQujAoRxL6x3P8YSQGMCWcHNci7z/AiRJPZ1IX/iZvT1XgJ7RJyDjvEaR5zg==
X-Gm-Message-State: AOJu0YwTfcRvaUkP82TZSIEt77+wH5gc7+7hke5vVZ7hffwh2bh0MR+t
	ndoImL2mu7DebI4nhw0SItiKhx5wQpIlZfkGqMpo7nmty+pYiiaR
X-Google-Smtp-Source: AGHT+IGv7k191x4u9LLzlTbJkEegKheluwwC62bck+eptDgKc99iYcp34EFkFxeloxTP4rrjn5D+zQ==
X-Received: by 2002:aa7:8218:0:b0:6e1:dbc:d05f with SMTP id k24-20020aa78218000000b006e10dbcd05fmr14900363pfi.1.1708508504103;
        Wed, 21 Feb 2024 01:41:44 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id lm4-20020a056a003c8400b006e488553f09sm1645026pfb.81.2024.02.21.01.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 01:41:43 -0800 (PST)
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
Subject: [PATCH v3 6/9] ARM: dts: aspeed: Harma: Add PDB temperature
Date: Wed, 21 Feb 2024 17:39:21 +0800
Message-Id: <20240221093925.2393604-7-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221093925.2393604-1-peteryin.openbmc@gmail.com>
References: <20240221093925.2393604-1-peteryin.openbmc@gmail.com>
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

