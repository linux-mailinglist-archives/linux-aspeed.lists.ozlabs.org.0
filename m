Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BCE1097CB
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Nov 2019 03:23:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MSPM2xm3zDqgV
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Nov 2019 13:23:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VSE0u60g"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MSP62LVHzDqdt
 for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Nov 2019 13:23:04 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id i187so4197319pfc.7
 for <linux-aspeed@lists.ozlabs.org>; Mon, 25 Nov 2019 18:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=unlpuGn7nivFmtiJp3WUnntkjXJ1id5sopgjYo1qU0U=;
 b=VSE0u60gyPELRZ7JTOR5++7SEE4+hwPzwj8nOy6OaBgAzsOLBGclKbilyUk3B5pC9k
 IEzwPawCG7UUP568XdzUhj8ybOQV9v3iej2HLaCJfDF8JNx3N8bcejQEZdS9q2c2gBNn
 uUrpNZMrooqkIfjyHZwgSMnv4hiAjjs7xgZCy5SuNAz7IxdflkCfEu2JzFJe1FI6TFfs
 ZDnAnaWQMH8DyWf+HaHhWJsgThUXbfpMy1lqCFJWaxK0hRWLzA45PK84/A702SAQUPlT
 rJy8+lZu7joBEVB9ksp6OQLpSTedhctHgTDMGFw4EK0j0PcF9MChPO9EQTX9cUNRvRDf
 Z96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=unlpuGn7nivFmtiJp3WUnntkjXJ1id5sopgjYo1qU0U=;
 b=PelmkHOdIPetE+NL2tGx/XndHrgRyIqRVCnDTe2m6MWvTAgB1tdM7WAZWXXBLmqkQG
 dyRpLmreg8MTPp1SNcgM0MTx17unpqzfXygPIBMe6Co3p8NnREcHEtHRoVZmS1e3ro8F
 PGBpb0D5IhzC0aAt1TuhqQlpoZfEjRuIu8oPsOJuxezyQXuZKkjFWxV4qDY26JGQEyZ1
 m9VXFXFq1tiRJXymnUwT0rd3dumUPfplUB9ovs/2S4EZ9MxMRE05klxUiuObSbu8SCMU
 pUgoSIaIfHxeY/9GTqUW09QlFmbLT50aiRCyl6NQYO270U4LZ2lQ+fSosc4wjWNDJ3Hg
 UUIg==
X-Gm-Message-State: APjAAAWxjurQenCIUXWuRfkJO62YSthMn3Gmyy0CPr90k5O4nf+YPFtH
 WO0sxp+pL8yOb9zakHtxrhY=
X-Google-Smtp-Source: APXvYqxhb551eaPvYW3aHcS2Y2jrA1e7OdTeqm5liDBTjQRChx9CJ8uw7qBXhW4MO/M8m/PZNLTKqA==
X-Received: by 2002:aa7:9abb:: with SMTP id x27mr37012105pfi.150.1574734980360; 
 Mon, 25 Nov 2019 18:23:00 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id q70sm666568pjq.26.2019.11.25.18.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 18:22:59 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/2] reset: Add ast2600 support
Date: Tue, 26 Nov 2019 12:52:41 +1030
Message-Id: <20191126022243.215261-1-joel@jms.id.au>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This series adds ast2600 support to the reset-simple driver, and updates
the device tree documentation for the LPC bindings.

Brad Bishop (1):
  reset: simple: Add AST2600 compatibility string

Joel Stanley (1):
  dt-bindings: mfd: Add ast2600 to ASPEED LPC

 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 11 +++++++++--
 drivers/reset/reset-simple.c                         |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.24.0

