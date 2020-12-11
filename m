Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 815702D747F
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Dec 2020 12:10:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Csp3m3yQZzDqm6
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Dec 2020 22:10:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=aZcfuV+Q; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Csp365fgYzDqXg
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Dec 2020 22:09:54 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id q22so7981415qkq.6
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Dec 2020 03:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=WQKg3cIi4hIsPZ9PKTpFROffzkUZwNMkNLWOKFleW9g=;
 b=aZcfuV+Qkm9nAiS4xpqiErZ/wAhNCH74SMJUU8MzxLIFNhVDD2tu0R9cULkdJQS3rg
 fJ7sjGTPldSUiyIhPiliEpZ83iFoRyNiAL3AXZxLRX/AqahpqDd9HYbQ9aTNfMos3N8K
 g6fuJF+kxPa4FbbUX8iVWVMhlIkk89tsHupR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=WQKg3cIi4hIsPZ9PKTpFROffzkUZwNMkNLWOKFleW9g=;
 b=n86MUFBZRAWudIRjDX7sYh5ezw9AqNQgBfjpcs+0HkrGJc+zMNSDVuLvFdH7xoxMOL
 fW6LsqYXSirbtNLazJawPjA+4W2a8i4TpDL6MQEdem2eP1GsjloT1baD1Ip5Al4Z4+HQ
 VkmskyXNAMRUxSMIm2U2XxkAzg0IwVv4SHfMMRuraWJxi29YfzizTqmg0G/oc2vKq00E
 x1wmLGIOFD0JlglOmDzgFRDKZy4HJE91jdEVIbJAZ3sB5n+kipBAlmBqExsNu8nGwRc2
 y4/I9am3WgrHOUF3WSk38nXfRYxvB0w2W/deQT4zEQCz/IC3U+zql9yb6y/eANx61ORK
 2nhQ==
X-Gm-Message-State: AOAM530EmmagzdIC3Lp0vc0H/A3pZsNm0fnQZ0/xhsgC/aDV3OmrIYCn
 UIYUuTSsGPlWyrwHHZc06Aij266ICv7A7rSDCIDkyqBAUeeETw==
X-Google-Smtp-Source: ABdhPJwI23GtC+rkaLZlWggpvfMhMnaZW+1xUUVYq8uFgZ6fR4Z0ABo3J/ivNeYAPB7FSf3BrykDpHzHhs00/+4VHLE=
X-Received: by 2002:a05:620a:31a:: with SMTP id
 s26mr14911021qkm.66.1607684990215; 
 Fri, 11 Dec 2020 03:09:50 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Dec 2020 11:09:39 +0000
Message-ID: <CACPK8XfkZq51yKJUjyqgKD=R-WZiCR0J18GJBbo=tfMKMMddSQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.11, round two
To: SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>
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

Hello Soc team,

Here are some late changes for the aspeed boards. Most are fixes, and
the addition of a new machine from Ampere.

(Arnd, I realised when sending the LPC clock fix that we had a few
others fixes, so he's a pull request instead)

The following changes since commit 5124cff93d99bbfe1efc8deb0c0b3604cb9a6659:

  ARM: dts: aspeed: g220a: Fix some gpio (2020-12-11 21:28:02 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.11-devicetree-2

for you to fetch changes up to 5124cff93d99bbfe1efc8deb0c0b3604cb9a6659:

  ARM: dts: aspeed: g220a: Fix some gpio (2020-12-11 21:28:02 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.11, round 2

 - New machine

   * Ampere's Mt Jade, an AST2500 BMC for Ampere's Altra reference
     platform

 - Fixes for eMMC, LPC clocking, and misc fixes for the g220a machine

----------------------------------------------------------------
