Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C7C4A5608
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Feb 2022 06:05:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JntD53DmZz3bPT
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Feb 2022 16:05:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aT+IUQJ6;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aT+IUQJ6; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JntCw30Lsz2xKT
 for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Feb 2022 16:05:14 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id o11so16043390pjf.0
 for <linux-aspeed@lists.ozlabs.org>; Mon, 31 Jan 2022 21:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p0Mf1pHgKLt44R6XPdoONMmYbFvFAfcUL2WgqQxrsAY=;
 b=aT+IUQJ6Tt/CjegESk7cg0DT2FeroIJIIxaAFM5G4s8Rg9QaxwObqyxMkHrOpDqdLg
 3AIN1rDqnk2AOG46cY+qPoNfxx/06EvO6ynGhfs84jy2PYJAWzMDw+UISt2bkTSvSxOg
 /+G4lOkLLapdAReBuzi3cR8vuqmK2XjKgnnwRioZGKPZeSfdMltm//5XBQxQJL39xykk
 AqhWCw6dJ4HN7dUWK3SIP+32xm28SMwV4fCY1RJXKqp3YFsZpPJwoIh5onfsUsZ4i5mo
 k0BWmQmFFFEbEjtq/sO7VzmDefsPYUPw/gFvfy9tkp45tri0qyO27vXYdQpZSHrwj19H
 tZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=p0Mf1pHgKLt44R6XPdoONMmYbFvFAfcUL2WgqQxrsAY=;
 b=sgFdQIQ08CJygQUCeVOV0ZN1s1g4wq2HaICFoskWCeC0ko1X/qAbif8iLkDfsiqbTo
 +VwPEqs8XMvmCOvuuXRyZKdTc+SOMDgQ9YnwxYh+pbyn4hwH6i/4Uk3/+bWfHxWSOjux
 JyrIJ+P3cd5sT4PNaHHG5quzfJ11bojsMtYH33+JmEaeunFLMeiOFkX7gX70/s5ekPCg
 6gQ/WHj1+nB8RLbPCBi7u/DPJYVHQyLiP+rffE0zCRmsTXu/Ki7X6oYF2GoDMHQ97y/p
 oiCl9OudApx2wRtPBT/WdQfnV9vEBPkkt63GKKqBfstuc5Gj4nyIkfvu3Ne3sI3oYLEF
 imDQ==
X-Gm-Message-State: AOAM5330qB4u8TjS5pUL48EOsXQtEoaM5X3Ft1Otox72kbEAtJl+Ul/u
 T3wTH1EK1oQNl7L2gNH9YQA=
X-Google-Smtp-Source: ABdhPJx1OxZZ3RKrxjSrKQtiVOjcEKe2hZLtXa+SV4AiPF06dGcRfVxGwqlxXacD5FNY1dgeGx+M6g==
X-Received: by 2002:a17:902:d4ca:: with SMTP id
 o10mr24427520plg.28.1643691910056; 
 Mon, 31 Jan 2022 21:05:10 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id u37sm6181991pga.2.2022.01.31.21.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 21:05:09 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH 0/2] firmware: Add boot information to sysfs
Date: Tue,  1 Feb 2022 15:34:59 +1030
Message-Id: <20220201050501.182961-1-joel@jms.id.au>
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

This is the second iteration of this idea. The first used socinfo
custom attribute groups, but Arnd suggested we make this something
standardised under /sys/firmware instead:

 http://lore.kernel.org/all/CAK8P3a3MRf0aGt1drkgsuZyBbeoy+S7Ha18SBM01q+3f33oL+Q@mail.gmail.com

Some ARM systems have a firmware that provides a hardware root of
trust. It's useful for the system to know how this root of trust has
been configured, so provide a standardised interface that expose this
information to userspace.

This is implemented as a sysfs attribute group registration to be called
at boot, with the properties described in the ABI document.

Alternatively we could put the properties in the driver core, and have
platforms register callbacks for each supported property. This would
make it harder to insert non-standard properties, with the trade off of
more code to selectively show supported properties.

An user of the properties is provided in the second patch.

Joel Stanley (2):
  firmware: Add boot information sysfs
  ARM: aspeed: Add secure boot controller support

 .../ABI/testing/sysfs-firmware-bootinfo       | 43 ++++++++++
 drivers/base/firmware.c                       | 14 ++++
 drivers/soc/aspeed/aspeed-socinfo.c           | 84 ++++++++++++++++++-
 include/linux/firmware_bootinfo.h             |  8 ++
 4 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-bootinfo
 create mode 100644 include/linux/firmware_bootinfo.h

-- 
2.34.1

