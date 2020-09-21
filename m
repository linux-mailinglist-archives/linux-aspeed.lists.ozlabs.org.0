Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F87271926
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 04:07:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvnrJ5Jl6zDqWX
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 12:07:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Xa72Kts3; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bvnr44dqGzDqV6
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Sep 2020 12:06:56 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id md22so6217791pjb.0
 for <linux-aspeed@lists.ozlabs.org>; Sun, 20 Sep 2020 19:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iZUg/ce+1HYpD4B6gMD7V2L20Pbr5ZUqnwEDb7JNX/o=;
 b=Xa72Kts3jVXlY2elD1zj8cwWXwWdyIKSrcQkXHVIe80qgWnLNNcp+0BfwvtZodkehx
 esBW0t+vJ8d8F7ioDs8m2kR4bl31jiDbilKCb7VqBPdlSgDftmMbe+wHppDN4vR2Oyqt
 nA9nEhFpZWsIulMZq9OlfPcjbcIuqhbym7CEEKkjTeESuCN5U49FpQw2WmDeM7wFucB4
 HcdhDCyH7Paj8VZCfPmO16+zPeWn1n0z4b9apSitx/rqFi/zfLQsuG8tymc/k3jtvk1x
 uMYjcvlG8cC9EzOuZCj0I0l7x18pmJ+wOlruTZ0/4p3WoqtG8NHInYcUKKQ//TxKjrDZ
 iEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iZUg/ce+1HYpD4B6gMD7V2L20Pbr5ZUqnwEDb7JNX/o=;
 b=dnhB5fRyiPLqDXghxcCjPaTPReAWwjs4TCjF5qta1TV/kUH3boGnUkYaa2MYH3MafF
 q1kyGYJpqiMQnvFzm+D3svEwg+COJuRZRPX7dvl6Gpq8CeQ7JnJ63lhygUAjLDT1i8y9
 4JnR7iTR2f7wt46/2oXTLB33O3QwP7w/T1RIsCc/Hii2YMo3nRpK1ASAYueP0iSLNacs
 trbetWY+xzXND0Z0/VZZwYHuN0Y92/26F6290/wM6C3SIYdmSEpq2LJ3GUXE6k36lXal
 wO9HoJ90yLwBGQDnTTXOrYtfBxJ66FCYSUwBOa8wwnrr/UTvI7dqGbl1whToONCnQ7ta
 5bNw==
X-Gm-Message-State: AOAM532njqTdlUP7j0ielvsKNHqnqNPFZ+qFxN7mermfnY8f2Fzh65fP
 x70Wloi8ivvF0DHrpF2Laf0=
X-Google-Smtp-Source: ABdhPJxtSJcRDriyGXojg+R/Gfh2dOIUDr+T286JHMYpyZAuNyMNliDrlB4GiRRfBt1RuXAQlFfv2g==
X-Received: by 2002:a17:90b:a0a:: with SMTP id
 gg10mr22935200pjb.20.1600654012917; 
 Sun, 20 Sep 2020 19:06:52 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id z23sm10212045pfj.177.2020.09.20.19.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 19:06:51 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/3] ARM: aspeed: Add socinfo driver
Date: Mon, 21 Sep 2020 11:36:38 +0930
Message-Id: <20200921020641.48733-1-joel@jms.id.au>
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

v2 addresses Andrew's review comments

Joel Stanley (3):
  dt-bindings: aspeed: Add silicon id node to SCU
  soc: aspeed: Add soc info driver
  ARM: dts: aspeed: Add silicon id node

 .../devicetree/bindings/mfd/aspeed-scu.txt    |  26 ++++
 arch/arm/boot/dts/aspeed-g4.dtsi              |   5 +
 arch/arm/boot/dts/aspeed-g5.dtsi              |   5 +
 arch/arm/boot/dts/aspeed-g6.dtsi              |   5 +
 drivers/soc/aspeed/Kconfig                    |   7 +
 drivers/soc/aspeed/Makefile                   |   1 +
 drivers/soc/aspeed/aspeed-socinfo.c           | 135 ++++++++++++++++++
 7 files changed, 184 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-socinfo.c

-- 
2.28.0

