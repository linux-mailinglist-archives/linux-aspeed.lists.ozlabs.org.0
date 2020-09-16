Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7564326BFA8
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 10:47:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrtyS6qHJzDqW2
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 18:47:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZNbYUSMI; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrtyL50d8zDq9R
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 18:47:22 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id w7so3580810pfi.4
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 01:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uHwIU1Jo4n06xkHbAiCRBKm5SEMl0/6j1oOu7Df1a8Y=;
 b=ZNbYUSMIaxg1hotdQodGFGKb8pOvXU+JDSmNor4NARNX25LP4wMnZbVVkb9tFrdUMq
 jX301P2/sv31TmdbpW1ZT9ft4E3aafxp+rbapb1Ur4iKMpg9iTd0Am38WKyzAdOFvxuJ
 jWchWvZfnm1pe5CVcsr+1djrqhSVIrsrYhYLBu/IpB6VfrJq7lFnJ0qUqT8iJvoSDtlo
 8aWoDhRGruBo0ye2C+2BDVtmrX3DoNJtYOWABCY+2ZdGi+7nWr49h2yHgQSv8FNPpRqp
 ypcjMMmYQe+dJGmzWLQYB5au8N1CiQc4FyF7rCe98ZMObgCQbcoDpTpvybrc2ZmJyDck
 ej8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=uHwIU1Jo4n06xkHbAiCRBKm5SEMl0/6j1oOu7Df1a8Y=;
 b=g1cWmm4A2IOOC5spNzPtL7DlzUSDjJenwBUTp4HJ1Jri3qF/ss3PbbFN/0JRZ0XeyP
 hBglSFFL62K/IgICy9DAqtB7bTMQ+qbciK4/KemkJsNb+0BdHdxmYzmEoUM7GV1NdT09
 Y9/LOpOOP3FIEr+ROeP4U9uj8CTV3ogXGRuhukopCUsNGv9Egb1WVIk6Gt0nXe2vV4xG
 sArpdKXf/Kj3L1NLGV14xHXKlUaS911rWyQB5fU42sqM+wt5AeEVnUg3D5+CddkrX1Jz
 JvQqtXzGnmJzTE2obhxuRfin5m26CRCRozSonAwkR/lotQIhdXDmzS/KwQ7ajMdPZYCM
 FoWw==
X-Gm-Message-State: AOAM533N+41VgM9GjNCzUwGWbqwv2Li6EzxM42Nq+bWJ+cGocuuGR3hO
 ZpLfvlSSXCw8GhBAWOdX9bg=
X-Google-Smtp-Source: ABdhPJwBt2XcTOnQ9VzmzzyiGsGTfjwR3fHPD/moUZ9Y8OMCAcSoSSHJlWyyagDCBgVMbwD+486dsg==
X-Received: by 2002:a62:8f42:0:b029:13e:d13d:a12a with SMTP id
 n63-20020a628f420000b029013ed13da12amr21183142pfd.18.1600246039154; 
 Wed, 16 Sep 2020 01:47:19 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id kf10sm1925323pjb.2.2020.09.16.01.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 01:47:18 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/3] ARM: aspeed: Add socinfo driver
Date: Wed, 16 Sep 2020 18:17:00 +0930
Message-Id: <20200916084703.778386-1-joel@jms.id.au>
X-Mailer: git-send-email 2.28.0
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This adds a socinfo driver for the ASPEED BMCs. Please review!

Joel Stanley (3):
  dt-bindings: aspeed: Add silicon id node to SCU
  soc: aspeed: Add soc info driver
  ARM: dts: aspeed: Add silicon id node

 .../devicetree/bindings/mfd/aspeed-scu.txt    |  23 +++
 arch/arm/boot/dts/aspeed-g4.dtsi              |   5 +
 arch/arm/boot/dts/aspeed-g5.dtsi              |   5 +
 arch/arm/boot/dts/aspeed-g6.dtsi              |   5 +
 drivers/soc/aspeed/Kconfig                    |   7 +
 drivers/soc/aspeed/Makefile                   |   1 +
 drivers/soc/aspeed/aspeed-socinfo.c           | 141 ++++++++++++++++++
 7 files changed, 187 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-socinfo.c

-- 
2.28.0

