Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D500B944FF3
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 18:04:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S8Y1FeY1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZYgg5bL7z2y8W
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 02:04:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S8Y1FeY1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZYgD0mTFz3dRb
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 02:04:07 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2cd5d6b2581so4923351a91.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 01 Aug 2024 09:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722528246; x=1723133046; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9MVRVw78cAnGxBai+z1t3GEr8C1bFmf/TOYviQnigs=;
        b=S8Y1FeY1a3LIy9Wyc5hoodFf67gHE9GC4ahRO61Jp6dC5c+GNktX7np98eLLsqOfOf
         hd46MfsfKJVw0N/gFIJwDNMCuVewAe45y9eB+o4KQe1Ptepsi8HYonIRmvC6qC6k4v37
         E6r/M5IxcUbMGeOxrZePY8ms9x41fM2JGr0ZAo5D1v78m03GBov9Nnulsjokm6mT79zt
         IZbutkDgMVHMSEoc1LQonHHgiOft8/nNW7tYAeVFMEMvdvHd2WFWtLFP96wJtYwG7nmm
         WR1X6MRQwLwNzirOR3aCVaqpJQhvuVSrW8A+paBI1oJoF4o1F6kDxEoIKk7kuGrfIRNI
         Oo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722528246; x=1723133046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9MVRVw78cAnGxBai+z1t3GEr8C1bFmf/TOYviQnigs=;
        b=DuWeZnRFhJL0Pv74XWGSWNQF6eUag5fQLLw92gvBOnLrYBeezNyxi55Eaegx6jM3q7
         YtvRl7xwVyHq6qAgPi/HzRLF3WpECsxHo+mGOhQb6YameWrxP7sRdrBXUuoFS7lptX5j
         E3dpvx1kS+gce+oo7bqMU5gb2yDJ5WCaktQu25bc7P5H96QGwA8MdesRlcMVXX3dOFuC
         6sU+sOcg7YrGlzKEaqxz6UeYvfnUpeknPNfBIODogypWoS8xwN48uFN5irf0go36myK5
         TvJZWyqUgsHxAvU1H5R4RSLy31AZjxB8gZcmROSvEfYkmtmTUypWSQT90TTd7ccJJkmW
         J7oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWda7/u+0VK3AMpfc4HMfYpPiJKL0jJm8rMpxpRdfB8QK9AVeAKADeLEzztlauubzGCHDZfixKY95FxMgkGm+kRdP0P5FNLJF55f9B0vA==
X-Gm-Message-State: AOJu0YytCKHkjsIWB6BwExtfjZwznwiRY8DPKwkO5zpodC2l/xPMKc5Z
	nc6gKdlq52d+26HE4a1quBHMBE0TR0+0arWi0F4rId8xh9CsjIyYm5cWhQ==
X-Google-Smtp-Source: AGHT+IEHZrIuu9OOWAbdOXoUsSvEIMIF2LGmw91wiJQnNRv7S4gMKbaWOSTWTPf1B+BWzPSqb6QiUA==
X-Received: by 2002:a17:90b:274b:b0:2c9:5ecd:e3c4 with SMTP id 98e67ed59e1d1-2cff953e8b9mr833249a91.35.1722528245351;
        Thu, 01 Aug 2024 09:04:05 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4cf181sm3535268a91.37.2024.08.01.09.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 09:04:04 -0700 (PDT)
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
Subject: [PATCH v3 09/11] ARM: dts: aspeed: Harma: enable mctp controller
Date: Fri,  2 Aug 2024 00:01:33 +0800
Message-Id: <20240801160136.1281291-10-peteryin.openbmc@gmail.com>
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

Enable the mctp controller in i2c9.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 0455475fbcff..0dd0566bbf27 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -382,6 +382,14 @@ &i2c8 {
 &i2c9 {
 	status = "okay";
 
+	mctp-controller;
+	multi-master;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
 	gpio@30 {
 		compatible = "nxp,pca9555";
 		reg = <0x30>;
-- 
2.25.1

