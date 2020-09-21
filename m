Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3BB271EB9
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 11:17:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvzNV3jMjzDqcW
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 19:17:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ldsSZNkr; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvzNF6HrKzDqTM
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Sep 2020 19:16:58 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id k14so8475238pgi.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Sep 2020 02:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O0usRX3IupYhm9xLYMHxSSpnG9Oszbsh5o7UQiNJyv8=;
 b=ldsSZNkrmVUvrKjrSlDJvzXiz+in9dp1pNf4/dDAWW50HVOQ0A4lI5T6l+fttjZgI7
 RCSqBpwChYrMTZZNr0q8akQMIU4JLnWP3xCy1SmdaPuUtNJsT9mq6bg78CzyHqSK0ccu
 KpMQxcQooEfa8BMgUx2zuZgUHZnYagsIBr5CSNoEjMFOdzlMa6wSV3z7N/C7Zw8/Z8Pl
 Pott4eCBbHXWFTUgcldSs2XXEUjiSVt4/3U0XyAPnGKQA9Cd+MtYe7DfzMhVuR6hL0u+
 0Sf0fjC3+oPyJGX2VbCZXCa0LstKYAb5n2By9l+5/+tzMWvbx4ivFJryBCVaXYqfdqdJ
 5gOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=O0usRX3IupYhm9xLYMHxSSpnG9Oszbsh5o7UQiNJyv8=;
 b=U1SpmdLBs8kRWTJfJiTG4Lt0epUMDJpS/WYJ4uD9qMETcJXYkruBu7dN+4SUVjMLjw
 7tlFIF606hxYncYJAFXv/1rwvIhHb+EPv2RGEdk3cQJA9pT2kNBNbE9heXZSuJdHHMwO
 K73ZkpYDtgMFcQgQ1LTAyBCLbvGVma1hcVgDkqHpQey5pG/tyBHNHBZSW0KR8+MmgfWH
 ogQr46XAQbTzSGcxwD+ovgJ+o+uRRJtv8dCJCRPbUrafZrPZ65vMEzgVM4gsvwAphGCt
 a4FApimAC9qYYu/Lobfv6RzbDtFjkDjGWYnHtrZo+I/E/aJqChEvDq6YW3YSh0729Dr7
 Xbfg==
X-Gm-Message-State: AOAM530jwSZi4en0Rfy4bm7EDXvR282FaXRko52PnAPTlEs0oOgV0bTI
 whW4rp/Pv3u92mK6fSzoqvQ=
X-Google-Smtp-Source: ABdhPJyGquNlLPQwLAwU1JyI954cw9uZkKT3NrTQKQh16JzAoWT49zpJX19KTAP5OLhY8/tDtsw3+w==
X-Received: by 2002:a17:902:bb85:b029:d2:21cf:dc77 with SMTP id
 m5-20020a170902bb85b02900d221cfdc77mr4958843pls.66.1600679814654; 
 Mon, 21 Sep 2020 02:16:54 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id gb19sm10105690pjb.38.2020.09.21.02.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 02:16:53 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 0/3] ARM: aspeed: Add socinfo driver
Date: Mon, 21 Sep 2020 18:46:41 +0930
Message-Id: <20200921091644.133107-1-joel@jms.id.au>
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

v3 removes some unncessary frees
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
 drivers/soc/aspeed/aspeed-socinfo.c           | 133 ++++++++++++++++++
 7 files changed, 182 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-socinfo.c

-- 
2.28.0

