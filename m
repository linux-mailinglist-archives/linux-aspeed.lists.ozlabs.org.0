Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C644D3DDD
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Mar 2022 01:06:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDTrX4gGRz3bWD
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Mar 2022 11:06:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cL90pwuA;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cL90pwuA; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDTrP0gyPz2xtp
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Mar 2022 11:06:42 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id v4so3762219pjh.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Mar 2022 16:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T1ujvJm98v5RbioCiICvb25psuyRN7J+JVkZDUAT5p0=;
 b=cL90pwuAfqCntZ+tmsVjpHb4a1W664t6RP6KJtC7EDpUdiTX6qFpPd7mkMPYC5kVoG
 ALwV1W3WO8/41PdeHpz5Bd2Z6qfaOu16w2vsIL7mdeLhyju8Hdo0oTTukYXhtl0qshug
 w0Ieesi8qtkiJVnboGkogOyWrtzvw4RdWT2wBsvwgfxXUVh8F7ARwbfnB3L9ISCJ0q0q
 YnVnY1C/sZqhidSef3KYDnNklq2lhr5Xi/pCiKqfpPNEU0CeVb/8Pr0a9O//lEq3vtB9
 H2eQ5JozQU3IEwVwpbSIMOagJLTnGrZHeyo8trOW6hWz9aVYy0siSNDcWZ+g61itLTJ6
 qWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=T1ujvJm98v5RbioCiICvb25psuyRN7J+JVkZDUAT5p0=;
 b=FNaKifi4w5rlOEU6swB4ijpw90bQBa98nI6LreW368rgXVeh37raluwVfvIgO5apxz
 pxGx30R4WaUvQXcyx6DK3+/FUTNrZRmk9JZkqrRsz0EEf7tC1cL2KChw8pj2v0PoZVcK
 G621VpOC+Bg/A2nIPpEt5ED1Nh/x30nqO3fQfhWZgwEjUxBwJATkWBH3VwPaDjUoLmdZ
 orw6ibuc8yXT1SPB2HKl6sXVGD6SoKdoGdWR2JhDtXjX+6kWh6AcWXFSO2CP/0J1WQGB
 9CdLR5t8xlK7Ju2RznlfNNHsQrtvZdjj5LRBzWf5mxyeC/i12+ALoYGB8ipzpHczAu5+
 ooCQ==
X-Gm-Message-State: AOAM532lIl+MJupwOF+MiwyKRB7MHOLU6VjQZemHegd6fNidc/vIFOnP
 2G6Ja+nYAajnxfDwqW/mdC0=
X-Google-Smtp-Source: ABdhPJwK4cj/Kgz6lTz3eWxP1ZbwjcJ3ptml7HQ3rSKf362dWjLO6dSAVXvwVz9nLxTufi4vuI68Xg==
X-Received: by 2002:a17:902:7105:b0:152:fdad:fc86 with SMTP id
 a5-20020a170902710500b00152fdadfc86mr2147491pll.152.1646870800994; 
 Wed, 09 Mar 2022 16:06:40 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a056a001a0600b004f2a4316a0asm4213405pfv.60.2022.03.09.16.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 16:06:39 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 0/2] ARM: aspeed: Add secure boot controller debugfs
Date: Thu, 10 Mar 2022 10:36:27 +1030
Message-Id: <20220310000629.119699-1-joel@jms.id.au>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

We're creating a common API for a subset of this information in sysfs:

 https://lore.kernel.org/all/20220204072234.304543-1-joel@jms.id.au/

However, machines with an ASPEED soc need the detailed information from
the SBE that is not relevant for other systems, so expose it all in
debugfs.

v2 Moves the files to aspeed/sbc, and uses arch_debugfs_dir instead of a
driver specific directory.

v1: https://lore.kernel.org/linux-arm-kernel/20220304030336.1017197-1-joel@jms.id.au/

Joel Stanley (2):
  ARM: aspeed: Add debugfs directory
  ARM: soc: aspeed: Add secure boot controller support

 arch/arm/mach-aspeed/debugfs.c  | 16 ++++++++
 drivers/soc/aspeed/aspeed-sbc.c | 73 +++++++++++++++++++++++++++++++++
 arch/arm/mach-aspeed/Makefile   |  1 +
 drivers/soc/aspeed/Kconfig      |  7 ++++
 drivers/soc/aspeed/Makefile     |  1 +
 5 files changed, 98 insertions(+)
 create mode 100644 arch/arm/mach-aspeed/debugfs.c
 create mode 100644 drivers/soc/aspeed/aspeed-sbc.c

-- 
2.34.1

