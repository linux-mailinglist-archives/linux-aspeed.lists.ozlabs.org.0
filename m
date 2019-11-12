Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DF5F8881
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 07:29:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ByWv35JdzDrNW
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 17:29:31 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QaxvWidy"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ByWS5VYszF3wT
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 17:29:08 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id f19so11132868pgk.11
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Nov 2019 22:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XPGp0bDrthOzfA7hegg0HdrE+g59AtK+8Aqw3yGjwek=;
 b=QaxvWidyiyu/WC4jwr6Dr7fWNrjEXsuK8+k2lwcp20i+dtFpszi27dEHjr35N4ERni
 KP8mCZHU65++MBiFP6fyRgTddbXW9ETVJu8VWnpHKztrocqdYmrnROmBjPCzQaPFrOfB
 hoTi04TJim9Ey/Mbfg/X4Lgn144h8Ynt7GPuX6PyvrfCIkocWWEpIFUGBmwTIFluOPIv
 zywWRJgiKZepsYNvkQPPENatXe3FJxICB2Iu4AY7HZGHLT4AIEbr4l6e/rf4McgVBnFk
 5lafQXhdMD5BS4HDxSnziaxa347CN0fip7HYV9mWGblYWOk5Euoc+whqihgRBrumgLaT
 11qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=XPGp0bDrthOzfA7hegg0HdrE+g59AtK+8Aqw3yGjwek=;
 b=HH+AV2G5dGVTfwMy+TH0nI9WIgR6Cwfj8pS6Kb52Va83ocFZuqblcQ25BqIFCjiQxn
 SM4SEibJsnJ1fjafTsbfD0UirwGgxr+TXmnFF2NJO61Q6LWE9YLWd4ZANIL5wpuTKjTu
 arEdSgEtbO5qWo41XI0a31Ih53GXnSduGvlc2u72lIu0cM/4dUS37BiS4aeX+/JKqLgJ
 BBhzJMuzTOyzSjHpFfts/fkZLZOuXkEo2Ai+79Wbg+FY3919CLGh9cb9L7wtVhEVcoSA
 +0SxvGJC6xqZ+ViWhbBwE29Tn84pBhKKkutSXSIMMqNPQIw7x9T/MxK7UUsBeaHSZbiM
 U4Lg==
X-Gm-Message-State: APjAAAX1iqdjlvfDExVaVjG59jV1GuMeSW6L6u/St6UPoOYqkQ4tW0Cq
 KEFCGr5a+eBhVtjCV2cdz/E=
X-Google-Smtp-Source: APXvYqxZDr43LTlBbbfjee4icvb0baDA8Dz+S7Z0/ESYvBK4mOjE76lo2wUohtQY6toZeJn5TzdhNg==
X-Received: by 2002:a17:90a:b30d:: with SMTP id
 d13mr4260964pjr.49.1573540146141; 
 Mon, 11 Nov 2019 22:29:06 -0800 (PST)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id x20sm18573707pfa.186.2019.11.11.22.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 22:29:05 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/5] ARM: config: ASPEED updates for 5.5
Date: Tue, 12 Nov 2019 16:58:52 +1030
Message-Id: <20191112062857.32638-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Here are some additions to the defconfigs for ASPEED machines that I
intend on sending for 5.5.

If you have time to ack them that would be appreciated.

Joel Stanley (5):
  ARM: config: aspeed-g5: Enable 8250_DW quirks
  ARM: config: aspeed-g5: Add SGPIO and FSI drivers
  ARM: config: aspeed-g4: Add MMC, and cleanup
  ARM: configs: multi_v7: ASPEED network, gpio, FSI
  ARM: config: multi_v5: ASPEED SDHCI, SGPIO

 arch/arm/configs/aspeed_g4_defconfig | 18 ++++++++++++------
 arch/arm/configs/aspeed_g5_defconfig |  4 ++++
 arch/arm/configs/multi_v5_defconfig  |  4 ++++
 arch/arm/configs/multi_v7_defconfig  |  9 +++++++++
 4 files changed, 29 insertions(+), 6 deletions(-)

-- 
2.24.0

