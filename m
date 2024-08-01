Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F4A944FED
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 18:04:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YJMCYPKu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZYgQ3K31z3dRK
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 02:04:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YJMCYPKu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZYg26Ffhz3dLj
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 02:03:58 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7a0b2924e52so3765387a12.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 01 Aug 2024 09:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722528237; x=1723133037; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajViM2jGRh1ABanPLV3vCUCQ26Ko5QKn2UQG+HIRUz0=;
        b=YJMCYPKuIFczMsCm7EqorwBaJHGhDGR5XibNPJf3jDty/no4AekD+bHfA7Na7NUkc3
         BvCCtBlFpEudzNcxD1QvryH3ip/xXtBtG6jzEh7BJsPK8uCWa3DjRRULd393+fT3aQz8
         gVc4ldvT8YVoAaOgLOK1hLVi3ys+msX1Titw6w2r8tjufgmx13fGD/OjVXoW/74Bu/Ji
         Y5RuqR1nWPJiwOxcZjEv7Jx70uRHfITSiUiQGffUd+zA5XmiSPf2o8+FGOBAU85SoWmX
         sJ4DCWGgIDLW2HbH6vd0hSU9+r0XlhkNK2IB97jHu/NGJ2cr6W/A4T12dR9RdSMSyoFb
         u7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722528237; x=1723133037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajViM2jGRh1ABanPLV3vCUCQ26Ko5QKn2UQG+HIRUz0=;
        b=r1Joqsl8pV0s1UVC3s2ij85wfGk2RDfvaR0haQbPsCJRx8B+ECXfmRHd2kYapz3NED
         OgISskCYdhvK6LwU/SYwFrMPg5T1ntgLAR7AM97fQdKyvrjG9R+VRrC7QOvPQSylIMmr
         N2RjvsxhkxlkJmFv+VgQfxc6oX2Klx+h5/xg/NKz3kEo2cvr59pRCb2Z9/ZQPgKT1kU9
         Ce76oN+WLgtHsYABHPLeApzBOy8XpYAfAWlFL7Pv0FF9W51wLGebakMdPesDsRk7BGJZ
         NHRTeuZKwlbM7SsofSc++QC9ZaxcO5QDeSMkA9RYDDauKeE5VRYOEg538victKgIcFof
         Qr/w==
X-Forwarded-Encrypted: i=1; AJvYcCXk0KSqLHPGkbIcQX0bIgGsx2P7COfbV7FOl8spnYT/3vnNNaDaIqBEnI/jGtWJhuW2ak5Vy7vJFBwYsaWnlioe7f+5XMyEhx76GMacaA==
X-Gm-Message-State: AOJu0YwMt/vqkXZ+QdlP8BHpsiMCiXQpaL3ArnPzkX61q+67a8CmTVKC
	ydgiYae1VMpIOMoP79suM83hh65oOuLzA7w6aY78aOYDSNI2jZcP
X-Google-Smtp-Source: AGHT+IFPb9PeJdPoYShorYa0WgTFplfuAl/P62poHQZvyFWCRtV2xKyxZ4mK+zBEpL9ulATY7qrOnA==
X-Received: by 2002:a17:90b:33ca:b0:2c9:61ad:dcd9 with SMTP id 98e67ed59e1d1-2cff952d0e2mr842725a91.27.1722528237119;
        Thu, 01 Aug 2024 09:03:57 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4cf181sm3535268a91.37.2024.08.01.09.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 09:03:56 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/11] ARM: dts: aspeed: Harma: remove multi-host property
Date: Fri,  2 Aug 2024 00:01:30 +0800
Message-Id: <20240801160136.1281291-7-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240801160136.1281291-1-peteryin.openbmc@gmail.com>
References: <20240801160136.1281291-1-peteryin.openbmc@gmail.com>
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

Harma is single host, so remove multi-host property

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 77eaa89b5eb5..e10ee54fe472 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -137,7 +137,6 @@ &mac3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii4_default>;
 	use-ncsi;
-	mellanox,multi-host;
 };
 
 &rtc {
-- 
2.25.1

