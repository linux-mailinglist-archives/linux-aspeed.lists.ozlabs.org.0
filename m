Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 031959C45B
	for <lists+linux-aspeed@lfdr.de>; Sun, 25 Aug 2019 16:19:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GchW5VHBzDqY6
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2019 00:19:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O3BjAdJk"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GchD6GyKzDqRP
 for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2019 00:19:08 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id b24so9902354pfp.1
 for <linux-aspeed@lists.ozlabs.org>; Sun, 25 Aug 2019 07:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RtYk7exTF7NfCD8WVZ5loNoPWEQYfaksEbf8ILjY4KQ=;
 b=O3BjAdJkNpamh1SmbCMA1Bzi6HhC+cUCkqC7QLbjPCkm51Ep5jVb4UAe6KoQhTxQbC
 1RvTU9evIGER0O0LJVvFEdZUW0RapKuldVzLsZR7aL+UzsZhZwpxgGXHBPABGJpMBnlw
 ZWAcsgxFfHCbIqJP/zWmESqilkuefaMSlU8sxFzmgxCFfGFwtTIWjt7JyXfK+S6r1A6v
 vCOH1TYFdS4tyOO0D2t/NtR0w6w1jCmVXbuXr6zTQDHNDKGeAy1JbazapR0bR22q4URD
 ZB1mH459wif49S4XnE670N4/zmMGR+B90TN56WGDMgSl3LUEXJVfjcD/5sbkyR4U//D3
 xRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=RtYk7exTF7NfCD8WVZ5loNoPWEQYfaksEbf8ILjY4KQ=;
 b=Wn5lrAFkJIbY1FPiWzsKajl1o77hCES+C8i9Pw9Eys41myeEW0y8kmOBMXBIqbJcJ3
 0mAJ33i0oxJ57tv3neCzzkcDbMasVQgDhtNNwXqqEIX61XVCbkpmBLtTo9jQBsbt6KyE
 Zip/qSpvXlRU+acN4PLDjs7yL5poFwnoED8MHQObdNj0iF4yO8KuypJuN7zG2ysDtAAi
 ZKx/uJrKQBDXlGUxq9xU+pV3vr7bPe9rEu0szT+0Px6h4JgRWRyoebrZSkqDRta8eD96
 3/Jv0or05TQ9eO0JxJois255jTJcyZi9lSHOfOuEH4tEJil1z4VcVuQx/qFqs5sgB64a
 I2Mw==
X-Gm-Message-State: APjAAAVbyvoEX7vZIgfU48QlhIT6XYuO71OnvLMMYRqzsZEHCbt/y4EA
 0tAKXImXkJ80HBxBfaJXiQ0K3Trp
X-Google-Smtp-Source: APXvYqw+BdGM2bYgXLSTAm2CCYaNa7tim2PpUW6H7sQva3iK/gVHzmXGpFoQosg2DoIgat46BIqllg==
X-Received: by 2002:a63:bf01:: with SMTP id v1mr11997789pgf.278.1566742746257; 
 Sun, 25 Aug 2019 07:19:06 -0700 (PDT)
Received: from voyager.ozlabs.ibm.com (pa49-199-217-21.pa.vic.optusnet.com.au.
 [49.199.217.21])
 by smtp.gmail.com with ESMTPSA id w1sm7734562pjt.30.2019.08.25.07.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2019 07:19:05 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 0/2] clk: Add driver for ast2600
Date: Sun, 25 Aug 2019 23:48:46 +0930
Message-Id: <20190825141848.17346-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello clock maintainers,

v2 of the clock driver addresses most review comments from Stephen, and
contains a few fixes found while testing on hardware.

Stephen, I did not get a chance to move to the new parent registration scheme.
If you would be comfortable with taking these patches for 5.4 I can work
on to moving to the new parent scheme next merge window, for both the
ast2600 and the existing driver.

Joel Stanley (2):
  clk: aspeed: Move structures to header
  clk: Add support for AST2600 SoC

 drivers/clk/Makefile                      |   1 +
 drivers/clk/clk-aspeed.c                  |  67 +-
 drivers/clk/clk-aspeed.h                  |  82 +++
 drivers/clk/clk-ast2600.c                 | 704 ++++++++++++++++++++++
 include/dt-bindings/clock/ast2600-clock.h | 113 ++++
 5 files changed, 903 insertions(+), 64 deletions(-)
 create mode 100644 drivers/clk/clk-aspeed.h
 create mode 100644 drivers/clk/clk-ast2600.c
 create mode 100644 include/dt-bindings/clock/ast2600-clock.h

-- 
2.23.0.rc1

