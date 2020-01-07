Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1429131E12
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jan 2020 04:44:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sJCC2XCnzDqK3
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jan 2020 14:44:07 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NE5X04jT"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sJBl0lfzzDqM2
 for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Jan 2020 14:43:42 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id x6so26804971pfo.10
 for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Jan 2020 19:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gHUbb7q4zKarJa/jENsWhe5joUzhUsIi3+/OkwV0nCg=;
 b=NE5X04jTW9D4AAlZ1NLkRw5E9lCP2JS0FFDHcxeKeNssEwk0Mk+MrFridEDJinkcxq
 syLjplEhUDUrD8ygUiPRE9enG6yVswHHLvmVT2kvZS/klLV4fLBVu+c3K2OXJswU4afd
 9kIXv1MJ2R5GIvuXapD/4vTtXP60JPelynxOKGpuszywHtf6QU/F1JJ6tx2YkzGVMaop
 UC4Z5ZMiLbiG67W/X8Stcl2y83ASsmSXYLypJP+UVWCQt4rM1FMDNLhTtCPlX6FPvXD9
 I9pu0MoNcHR6B1pSIFLeoMD6/5OFVhTHALCAlBkg4EHpv6yPNsSoL2UeZvr9p6QwpFDP
 CnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gHUbb7q4zKarJa/jENsWhe5joUzhUsIi3+/OkwV0nCg=;
 b=sutM/STuFSiFEqUv8WapiVWlbpI1KWXiDKFe0n6pglZJGRBPEPJHuy/veUFjv98kqI
 ObQiPUxgfPfSeR7oXyxdIUeziShthoR3btCyA9Mdolld2gVGmtmsqkMP0GMN/owGqr7C
 QifcSamtDKZSY00wqooLD8klFa+DVSqusqWUU3JQqDB4L1tLfKcI+KkQMdHzO0bxqYSg
 qJ9nEtgg3fVUacRtQ7YiK6A3sNtIv1S9kWqCjBQUm0cAj85xpGfGpgKLtK2dRJTp6Uu+
 dmAYd2LSwyEIfRVkPEq+eCW7YPUJCPoiNRZ8F3y9iBLhcNct8xkn7flncpcJgr+dTLTX
 QcaQ==
X-Gm-Message-State: APjAAAU5m5Iu/yB3ZV+yO7UN2PLJE2A81FK5T40IP5coa8xrXKg37+OX
 hGzyTrsXOPQxOQG8ad/EN8M=
X-Google-Smtp-Source: APXvYqzKmGQn30OyGYuc8Yfb7XzY/DQP1By/9LJ3V3cFnc8q3uPr3UXvgAaQ6v64km7Wwt3R6On/ZQ==
X-Received: by 2002:a63:ce55:: with SMTP id r21mr97706108pgi.156.1578368620173; 
 Mon, 06 Jan 2020 19:43:40 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id g10sm73455929pgh.35.2020.01.06.19.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 19:43:39 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 0/3] video: aspeed video engine cleanups
Date: Tue,  7 Jan 2020 14:13:21 +1030
Message-Id: <20200107034324.38073-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.1
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
Cc: linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

When reviewing some patches from Jae I noticed the driver used compile
time tests for some registers. When thinking about how to avoid that, I
came up with a few cleanups.

Jae, feel free to base your patches on this series if you, Eddie and
Mauro are ok with the changes.

Joel Stanley (3):
  media: aspeed: Rework memory mapping in probe
  media: aspeed: Use runtime configuration
  video: aspeed: Update copyright information

 drivers/media/platform/aspeed-video.c | 73 ++++++++++++++++++---------
 1 file changed, 48 insertions(+), 25 deletions(-)

-- 
2.24.1

