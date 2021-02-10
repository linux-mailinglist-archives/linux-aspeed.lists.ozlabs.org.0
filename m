Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F463166D0
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Feb 2021 13:34:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbK2K4vqDzDvZQ
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Feb 2021 23:34:17 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=LHvT77Xb; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbJyC6mPqzDvZ5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Feb 2021 23:30:43 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id c5so1345580qth.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Feb 2021 04:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=K6Y8CEeI51JVKVFBNpZEdZAuFjEFDlhuqajn9o/8bz0=;
 b=LHvT77Xb3sRA+i67qoAcKDujAXWRnXedOh3AqlFooWQa90+us7QYqqegbJJGFfMUC+
 s3MC8V6k0EyVaMCf7qS/N/H7EKUhf+kdJfcoWmO17+kBFa2tgOg0ITZeBK4jCV14gGHM
 wepQj4Ftt+TlJH7uyCyFFlOIPLQXVXAujsiBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=K6Y8CEeI51JVKVFBNpZEdZAuFjEFDlhuqajn9o/8bz0=;
 b=JoxGCi4R3vtIcov4S3mhdLP5eLgV8lLxDp+nUzypYFLZKGzOXWSSGZuW+YIF9aGb0T
 W/7VNnNNx2bZJ8GfsKFirjoZUmszKOuu3HmgMrH4nfmSJua4w5pFyj7nlATg0s1vGUTj
 Q2KTxqWHsWQ7//3WcsoUFNvTqLuxJMqRX/LXrQYwWSHAfAVT1OZwg7eigQgGCJ0hz+0M
 j3HaW8zBV665aIsbTnAYSNianUAe95yn8OUPvRT/EhjK9wpMapIUk3jCC1TSLdUJMjs5
 kOBY8EwQwB61A7o49ZGbi3MllLrNDTp48KUruclF3eeDXLEByRCleZCT6jrigjmIM3ti
 QcPQ==
X-Gm-Message-State: AOAM531JEepd/EZPHJN9ZxfdcZmAvMnPCw5q7QXUV2qsqnywn6tlZPJ3
 km3sISMJBqfrGMNIszYCN+t13axYBDultXgmcvHeLdulIL5SRA==
X-Google-Smtp-Source: ABdhPJz4nqhjURxaff+V137RrYa6jcy7NOyn2z01tcRyGYecLPyd1UOZKfNnMC5+/A/QVwqNSy2e44EqGL/VQTWsZJk=
X-Received: by 2002:a05:622a:143:: with SMTP id
 v3mr2423251qtw.363.1612960239154; 
 Wed, 10 Feb 2021 04:30:39 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Feb 2021 12:30:27 +0000
Message-ID: <CACPK8Xf+4VkWC6rkHhsWdwhaLjy2Az=GAHaEe=SvOiUc_OGKSQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 5.12
To: SoC Team <soc@kernel.org>, arm <arm@kernel.org>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Soc maintainers,

A small pull request for the aspeed platform this time around.

The following changes since commit d0e72be77e7995923fac73f27cf7a75d3d1a4dec:

  soc: aspeed: socinfo: Add new systems (2021-02-10 22:25:45 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.12-soc

for you to fetch changes up to d0e72be77e7995923fac73f27cf7a75d3d1a4dec:

  soc: aspeed: socinfo: Add new systems (2021-02-10 22:25:45 +1030)

----------------------------------------------------------------
ASPEED soc driver updates for 5.12

 - Clock control logic for LPC snoop driver
 - New system ids for AST2600 variants

----------------------------------------------------------------
Jae Hyun Yoo (1):
      soc: aspeed: snoop: Add clock control logic

Joel Stanley (1):
      soc: aspeed: socinfo: Add new systems
