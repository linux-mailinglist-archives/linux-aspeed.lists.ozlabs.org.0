Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7834A835A
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Feb 2022 12:54:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqHBn2Gxfz3bbH
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Feb 2022 22:54:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pc58NPAZ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pc58NPAZ; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqHBc6DGTz30Qy
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Feb 2022 22:53:58 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so9801491pju.2
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Feb 2022 03:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vbzi3fankqPmSVkF0HyJbIAmlqbeSY/pVqmGMKJwLJk=;
 b=pc58NPAZa3q9fcA8NX1O7NkuWR6f8yxUDU8PA3ghuG09G6aKqYPvh//tJc0tjAyzmy
 Qo2sb3rRDNCa+JMVh8SacAjZ7tWyaEhDMLSW5MyBtd35UPLr//YzKLm/Y0ZBaXBtZ8ek
 OyOSkYQtSFIYOyuW00wbvMpk96FUDBkOhtrzlBUnKD0viFZFcc2ATRnVFKrosvR2oHRY
 liuHGiml+xvFwjedACesMlxh7xTOXq9Mmw8erU/QXjhnZpOP8OVbJZC8ZNBMndXkp1Jo
 8eDC89DZV+xfc5+FY7Q3bxVWi2yGidFrzRW4vc31Kv4ZfuQ79F54CkvOC8dZPtGDoBzr
 Dv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Vbzi3fankqPmSVkF0HyJbIAmlqbeSY/pVqmGMKJwLJk=;
 b=25uYSdjolSwkXORasbz17bR7o5eYGc+M1MYMGSVpjhe1KpQGjD6sDhmJ37bj5r1xzL
 pK1ZMePKwphdriEST/WJqSMCPxQN98FRjfo7Xfi/FeWaxqmEYWXmNLYTHU+W45loo1dV
 42X4Sa34lBUASz1tvvYwvTgT2O72TDh2QpUIqtZyD1sLSPbRJvMGW6yvtwZNR1KcGz2f
 At710dqUMlryQi45a8akA+ee0kvvSJ3vOlrGsi6ZgB39ubMIXdMVwEGmr5ZNkiyLKHtU
 S4wi79yWeNpfl8FUnr2WJctupWoE/jpMSraY7lcDrz9s+TXeehYfQmclLTGPWSHuVtEY
 lY4w==
X-Gm-Message-State: AOAM531xJBUBE2YVpxZ8/3IresERMx9hXs8mF0CtAHaw/np3ZI6J31p4
 TyuZTPgVp4eXM2h8M+j4WPk=
X-Google-Smtp-Source: ABdhPJwUN0BUpDlgp6c08hsp752MSFhAFyo6awcZ0a7owxfYBlbD/uFPHQjHzo63O3ZbwHKc143c7w==
X-Received: by 2002:a17:902:ecd1:: with SMTP id
 a17mr35603421plh.28.1643889235521; 
 Thu, 03 Feb 2022 03:53:55 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id mp22sm9586389pjb.28.2022.02.03.03.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 03:53:54 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH v2 0/3] firmware: Add boot information to sysfs
Date: Thu,  3 Feb 2022 22:23:41 +1030
Message-Id: <20220203115344.267159-1-joel@jms.id.au>
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

 .../ABI/testing/sysfs-firmware-bootinfo       | 43 +++++++++
 arch/x86/kernel/setup.c                       |  6 ++
 drivers/base/firmware.c                       | 90 +++++++++++++++++++
 drivers/soc/aspeed/aspeed-socinfo.c           | 46 +++++++++-
 include/linux/firmware_bootinfo.h             | 22 +++++
 5 files changed, 206 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-bootinfo
 create mode 100644 include/linux/firmware_bootinfo.h

-- 
2.34.1

