Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDFF4A9477
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Feb 2022 08:22:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jqn7F3w3lz3bY4
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Feb 2022 18:22:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JZHFB3AS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JZHFB3AS; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jqn7B3K1bz2yPY
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Feb 2022 18:22:45 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id q132so4348049pgq.7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Feb 2022 23:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zLaU+OooQpjOGfOPUlBT8gq0wmyxboLR+0UWXHSx00U=;
 b=JZHFB3AS8z11YYHqeTrTOxHnhsrXrL5s9NE9aKmi+f6IzzmqBBRtFi5yJPIrRk20Is
 LaVz3sE7CJjQ2OuiI89/O7eHlMpBNNQ44S78rhBoJDmCqlY5iVXJF58Y+9TXiP0LZNB9
 43ou8WMQxOYRDxVCTFPTboQ2g8ygsuI9OQ8ckRZKBXfe3qd8lvxPqOr6FZFP24dDN8cv
 Zt3Ye0QaGpXCv7bHmWMzkZzdj1S+ob7T59AWuraGkxbpqB5OPcKwOqRPOW4enHa1B5E3
 qG7PgwM1vdhL71BxI5/E//RL0pGUGoErCBEZNOpuaI7cU2uMMvIu+RfP+xNoEgUDttv+
 U/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zLaU+OooQpjOGfOPUlBT8gq0wmyxboLR+0UWXHSx00U=;
 b=aOy38SE5vvP+eHPyaF/rKs5uHhFJjHDx7zLRnYr8CJznDIWrp8aOQXqjVHRoTcFJE1
 LzrQWJ8S5v4n0vIt+uYwIUWhyNRh0iEAb3KK6qzmGflD97SMxTeI39XdxxpmM7Q8ssA+
 sNgAGQKJucWyjjxcpiAkDrVQbGYuc7QWRCQLbJHl/WDd1Z3tHc0JN++68ynAxyTNNNdh
 9hhSQtJOYCa3m3eSfcMaD2s/g6Mdxu8Du3nBqwPiz37ROgep9dXNgFTtG8VvUIi/4s+O
 +bGUTuVZV1uxNgEG6inpVs0OFdQuGwS4Mc6WIt2gZLzrBaZT3zuEtw7UdKAioGqnJ2AN
 sBEg==
X-Gm-Message-State: AOAM5312rBuRMD0FCr7ctdMTmdmLRbpPVZ4BsWjxlhmbSkWL5q/9Rhqm
 iORhEcwh51kGbV2bnpPEMqU=
X-Google-Smtp-Source: ABdhPJzgRaKNLRRcC5aRsfCldfqd3VmQV2yiZP9dmKE8/HvnW8TNcg+LXnnK0y9HCRkFUnE9LpEXjA==
X-Received: by 2002:a05:6a00:24d6:: with SMTP id
 d22mr1729342pfv.36.1643959362831; 
 Thu, 03 Feb 2022 23:22:42 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id t14sm11665328pjd.6.2022.02.03.23.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 23:22:42 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v3 0/3] firmware: Add boot information to sysfs
Date: Fri,  4 Feb 2022 17:52:31 +1030
Message-Id: <20220204072234.304543-1-joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

v3 resolves Greg's review for the bootinfo header and macros, and drops
uart_boot as it's unlikely to be common across platforms.

v2 reworks the series to put the sysfs properties in the core, and
optionally show them with the is_visible() callback.

This is the second iteration of this idea. The first used socinfo
custom attribute groups, but Arnd suggested we make this something
standardised under /sys/firmware instead:

 http://lore.kernel.org/all/CAK8P3a3MRf0aGt1drkgsuZyBbeoy+S7Ha18SBM01q+3f33oL+Q@mail.gmail.com

Some ARM systems have a firmware that provides a hardware root of
trust. It's useful for the system to know how this root of trust has
been configured, so provide a standardised interface that expose this
information to userspace.

This is implemented as a sysfs attribute group registration in the
driver core, with platforms populating values obtained from firmware at
kernel boot time.

Patch 2 provides a user of the properties on an ARM system.

Patch 3 is new in v2 and is an example of populating bootinfo with the
EFI secure boot status.

Joel Stanley (3):
  firmware: Add boot information to sysfs
  ARM: aspeed: Add secure boot controller support
  x86/setup: Populate bootinfo with secure boot status

 .../ABI/testing/sysfs-firmware-bootinfo       | 37 +++++++++
 arch/x86/kernel/setup.c                       |  6 ++
 drivers/base/firmware.c                       | 80 +++++++++++++++++++
 drivers/soc/aspeed/aspeed-socinfo.c           | 44 +++++++++-
 include/linux/firmware_bootinfo.h             | 48 +++++++++++
 5 files changed, 214 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-bootinfo
 create mode 100644 include/linux/firmware_bootinfo.h

-- 
2.34.1

