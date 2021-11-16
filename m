Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9408645346E
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Nov 2021 15:40:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Htpdd40LYz2yNr
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 01:40:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Pe6SYDGy;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Pe6SYDGy; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtpdX6PzXz2xXs
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Nov 2021 01:40:46 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id z8so43748241ljz.9
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Nov 2021 06:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=A7T0oZ2agpFPT+x039om0BDPYZgWScB8NHmnrpnc22o=;
 b=Pe6SYDGywVSeyjxIS36WrcAFBcDxDKGRtKzQHyYxTqi8dh60QOP9ZeYwUaQCjbwwT7
 soRgalO2vM1uknX8ipWgZjRvbY/bQIJnKj92UA9GMAmGXXQPenAJpKULX5lI0T8VD3UV
 TULU7HV2KZ4f45NcON1JFkAMJpQOcqdOBLHbGNd5wEMnaq0hlL2eqNR4zry8TmRUo0dz
 UEqufC/QPxhN1fkgv5H+Ka4fLvtcI8mCuJREJuRjTxEOHysNebzuLXZPKdkugcBdHspt
 3vbabnctH7HlmwI34yvsI9vVFWOhp3dgWPXguHozQjJa4lUDJmwnEVjvSoSjvKeV+mwZ
 PKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=A7T0oZ2agpFPT+x039om0BDPYZgWScB8NHmnrpnc22o=;
 b=VJmRPbe4ffiNklJ4Gqn0wPKDuvGP6DiLw5Lk9yWSjrfOu11s1KaMJvyMRcb639cbfU
 RzlbdaUHs5EZBHxWQbOQbrDGFAKPyPXxHcC+Zwgu6vgJo6Wkh4YgQG1swv0WqMmBc44J
 qroZITHSWr74ejVGtGOEgUaTj3DcWH4ZqIu5iMjfspE73b6SQxQiYq9AgMl4RonVNZLv
 B6ga7p4SY9j5dtI4oZ9I0pwdFPCkuH0Ogirui7qmjZFcn6otHBdOBW8GpTWTCmZIiLWo
 22EvqlrmMqeVUGMEUlOirmmH2Y5af37Uy7zD/XNEBRAff6ExXrfwbmGZOUAfc8vA7uSJ
 JVBg==
X-Gm-Message-State: AOAM532RLLIlaQtWCDW9l9IcOX0lxy1R2msbPjy7j6dckiOfB2OUj1Cj
 iMgoZsVSH5RGXrhAriT2xiAINisduxm2EL8MrE/7pw==
X-Google-Smtp-Source: ABdhPJy0YsbZPEDZnCHIZF95zhBf/DT7xh4nhBDED5JfVv7gc10mg8jDmKRr/QqcnXWQy6XTqH8uL0EwPDFuRGHhPnk=
X-Received: by 2002:a2e:7801:: with SMTP id t1mr7718059ljc.253.1637073638103; 
 Tue, 16 Nov 2021 06:40:38 -0800 (PST)
MIME-Version: 1.0
From: Oskar Senft <osk@google.com>
Date: Tue, 16 Nov 2021 09:40:22 -0500
Message-ID: <CABoTLcR2bHQCgV+ooVGE5GJ5NOeK1irDgg0P-rfErA=xbit0vg@mail.gmail.com>
Subject: vga_pw sysfs file
To: Joel Stanley <joel@jms.id.au>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi everyone

I'm currently upgrading from Linux kernel 4.10 to to 5.15 and found
that uart_render_controller [1] can no longer detect whether the host
is driving the Aspeed's VGA output.

I tracked it down to a difference on how the VGA scratch register used
to be read by aspeed-bmc-misc.c vs. how it's now read by the
aspeed_gfx_drv.c driver:
- In aspeed-bmc-misc.c we ended up with the full contents of SCU50 in sysfs.
- With aspeed_gfx_drv.c we now only get bit 0 [2]. Unfortunately, at
least in my BIOS, the VGA scratch register never has bit 0 set.

In uart_render_controller, however, we're checking whether the bottom
8 bit equal to 0xa8 (why are we not checking for != 0 here?)

For a test, I read both the SCU50 register via devmem as well as the
vga_pw sysfs file with this script: while true; do sleep 0.1; echo
$(cat /proc/uptime) - $(devmem 0x1e6e2050 32) - $(cat
/sys/devices/platform/ahb/ahb:apb/1e6e6000.display/vga_pw); done

# Host is powered on or is rebooted
1128.58 847.22 - 0x00000000
...
1159.38 853.16 - 0x00000000 - 0
1159.73 853.16 - 0x00000000 - 0
1159.98 853.16 - 0x00000000 - 0
1160.20 853.16 - 0x00000000 - 0

# BIOS starts VGA driver
1160.42 853.16 - 0x3F0A00A8 - 0
1160.68 853.16 - 0x3F0A00A8 - 0
1160.97 853.16 - 0x3F0A00A8 - 0
1161.20 853.16 - 0x3F0A00A8 - 0
1161.46 853.16 - 0x3F0A00A8 - 0
1161.68 853.16 - 0x3F0A00A8 - 0
1161.91 853.16 - 0x3F0A00A8 - 0

# VGA driver initialized
1162.26 853.16 - 0x3F0A0000 - 0
1162.56 853.16 - 0x3F0A0000 - 0
1162.77 853.25 - 0x3F0A0000 - 0
1162.96 853.31 - 0x3F0A0000 - 0
1163.17 853.38 - 0x3F0A0000 - 0
1163.41 853.43 - 0x3F0A0000 - 0
1163.72 853.50 - 0x3F0A0000 - 0
...

# Host powered off or is rebooted
1193.26 861.68 - 0x00000000 - 0
1193.58 861.76 - 0x00000000 - 0
1193.76 861.84 - 0x00000000 - 0
1193.94 861.94 - 0x00000000 - 0
1194.12 861.96 - 0x00000000 - 0
1194.33 862.00 - 0x00000000 - 0

As I understand, we want to detect the moment where the BIOS
initialized the VGA driver

To restore the previous functionality, the "easiest" option might be
to just return SCU50[31..0] as is, without trying to interpret it.

Another option would be to check whether it's != 0  (instead of & ) -
I think this would work in my example, too. If that's an option, I'll
test it.

For the check in [2], what BIOS was this tested with? Would a != 0
check work there?

Thanks
Oskar.

[1]: https://github.com/jk-ozlabs/uart-render-controller/tree/master
[2]: https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c#L294
