Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B93A192E8D7
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2024 15:07:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lpsckmK8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKZl03bKhz3cZ6
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2024 23:07:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lpsckmK8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKZkl1vb0z30Wc
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2024 23:07:09 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-75c3acf90f0so590473a12.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2024 06:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720703226; x=1721308026; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rfcikbn6aIkgCMZzgFg/rRrOdrcIMJdb5nB1Tqsn+HQ=;
        b=lpsckmK8txLbGHwCgisjLnZfyRSeZTrh5a4FYwslmrnkvDl7Ffds9oFbgY54aaNiGE
         jnZCmLnd/6mSRn6s5j6r0EZ4YSi7exW6WwCDYu5jeubgM7TxShKpKiiflt3G6mAhYmDB
         3OLxCurgmGqzUDJ8IQSROB003oPWN0glsl6PhL3O9UcHcl0GMSSsq7Q9bbJTFHoPRHoV
         dTqNXEZhpceCtp4JgK0eEmvCMC3R202HGNOjKG9hvlMK4zW5YRw/7W8Ts+JmhLdJaGa8
         RF5t6pnFtyhTOiT1it1fkXbLXnUtbmKoXr3RR3Cso9Y+FVqpWemYAz1DC0vciz7ghVEu
         kGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720703226; x=1721308026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rfcikbn6aIkgCMZzgFg/rRrOdrcIMJdb5nB1Tqsn+HQ=;
        b=Y4sF/79SND27IPTjK4MsS90thCxO123FBUfgRFSLOPEeraCuqd9VkOaKI4V+36heS6
         yc20xtBOwmD0R9bPJuQI/y24pc/dT5WvQNv2IRWol1W844MsbXgNSCS/FIwDqkIZ6xLG
         FhG7QKxh03nMRnn70VhSlLFnyVeuqYzJYOIWylDbDPc1WqYae1bspKHO4C2xeeoaYPO4
         z0UKeePdoHrAWmRA8Ji3Dk70vWk5kvXd1vqGo9quYJ4OiIbKzniHHNgeUm1XXF1yL8Ek
         DInkDDSPj5XJaDqXNbJf0eWv4eV4MYkplwlTZ0irzfy2/qiDGGaWDPR+sdPNYwY3nsov
         A8TA==
X-Forwarded-Encrypted: i=1; AJvYcCUtYAJt9X9a1EjCEgwL0u1ub27d9RbY9x6P+fUor6xtNKqKUEotmqD53ni1w78WFat/jl0GKcpi6m/fTLYlERgdXUlZEQH63e+BAChXrg==
X-Gm-Message-State: AOJu0YwDKreEYnDdEE+sh3bDPEbRepuOyih9K4fsFR5YmABjdzcwtBx6
	dE+ESo/XkOaT7urHThnqGryvOPOrtqovCVXTrsxKIanlKzBU/ra2
X-Google-Smtp-Source: AGHT+IFKPXUr1OLuiftkz50lboHtjDhk7taX+ATRjV0+GBPX70PqRG6CCAlN4MArjw88NEwHKiUM+A==
X-Received: by 2002:a17:902:fc88:b0:1f9:9221:6c2d with SMTP id d9443c01a7336-1fbb6ec1c52mr55718315ad.53.1720703225500;
        Thu, 11 Jul 2024 06:07:05 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a10868sm50188305ad.9.2024.07.11.06.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 06:07:05 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	amithash@meta.com,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 0/1] Add gpio line name in Meta Minerva BMC(AST2600)
Date: Thu, 11 Jul 2024 21:05:00 +0800
Message-Id: <20240711130501.2900301-1-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com, yangchen.openbmc@gmail.com, yang.chen@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Based on: https://lore.kernel.org/all/f7412b65e1844ea9f3ad9fe5825e5d1da422ad69.camel@codeconstruct.com.au/

Change log:

v1
  Patch 0001 - Add host0-ready pin.

Yang Chen (1):
  ARM: dts: aspeed: minerva: add host0-ready pin

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.34.1

