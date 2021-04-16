Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8568361837
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Apr 2021 05:27:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM1qp5q5Gz30KF
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Apr 2021 13:27:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=lGig1pNB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=lGig1pNB; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM1ql6mYjz2xy4
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Apr 2021 13:27:46 +1000 (AEST)
Received: by mail-qk1-x733.google.com with SMTP id 130so13362343qkm.4
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Apr 2021 20:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=hIEr+tr3/ET/1Cl+rSjZLlzUudCQ/0HpO0ED+ltgzjw=;
 b=lGig1pNBMlxzjmddWxyj0zU4kOdqrE+O58NgiXultbPSps0GikWUhIIpVBogYGDrqK
 MvxisbuXyv1tXvG1Ifc9AMlZqpofVA57Yq7HnOzFEAxQhWhEdNkA0ks//gnpK5rXdZnW
 E5A/RDr6c+C7OR33kSI85xUb0Gjc/yg9hSj9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=hIEr+tr3/ET/1Cl+rSjZLlzUudCQ/0HpO0ED+ltgzjw=;
 b=t9fauUYI3CFAWC8ACBN0oC+n+Gb85XR2mj2lS5ktbhK5teFwCujrhN7Zh8KYq4fRqM
 T50Tbpe6W6/vloQ82Xxrd5qcFKohe3l9n1T3CkFSeoVEI/0Mqa/V+BWLrhFc10XnhMu3
 jwX0q0wFPxCgO2hGgtWt77dYH2tANWGBg5LcWjJhZ134yL2IpJanRC5tuBiZEiPJjLP0
 0EknEG/VXudvBvIOR/W6l1euxmRZskvFsUVYKJVVNcf9sRQ4t+Xqro2jOVoQAD5U1ghr
 UhJsadZXyUYVDJHvd4QFQAGJKLq6sbeue4uEi2NOrIroaXEDd9qliftHuTYK+XZxrcB1
 XPvg==
X-Gm-Message-State: AOAM530QdonUz+K+Q5CLOZTz+VwKhnLz5Zf8VX5GZ2Y+vzonBG5IC65K
 pzMDHD5Igq5vfaWqX4q/8ROgezHCdwIGwNENpag=
X-Google-Smtp-Source: ABdhPJwo7aOv9fBXv6Ye/9cef0EbrWn2KMN5NwfyUtDNGBb/rSIK+BQamE4oOXmWc6J2wernKD4FS9tKwyE65VxKFYA=
X-Received: by 2002:ae9:eb94:: with SMTP id b142mr6744912qkg.487.1618543663075; 
 Thu, 15 Apr 2021 20:27:43 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Apr 2021 03:27:31 +0000
Message-ID: <CACPK8Xeet50bqWAY0jG_GRkgvKvFn94XtGDaq1gaVYVkyV_JUQ@mail.gmail.com>
Subject: [GIT PULL] ARM: bmc: devicetree changes for 5.13, v2
To: SoC Team <soc@kernel.org>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Soc maintainers,

Here are some fixes for the changes that have already been merged for v5.13.

I also merged some changes that came in later. If you would prefer to
not take them then I can send a pull with just the fixes.

The following changes since commit f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:

  ARM: dts: aspeed: tiogapass: add hotplug controller (2021-04-16
12:28:38 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/bmc-5.13-devicetree-2

for you to fetch changes up to f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:

  ARM: dts: aspeed: tiogapass: add hotplug controller (2021-04-16
12:28:38 +0930)

----------------------------------------------------------------
BMC device tree updates for 5.13, round two

 - Fixes to the first pull request for Rainier

 - Small changes for Rainier, EthanolX and Tiogapass

----------------------------------------------------------------
Eddie James (4):
      ARM: dts: aspeed: Rainier: Fix PCA9552 on bus 8
      ARM: dts: aspeed: Rainier: Fix humidity sensor bus address
      ARM: dts: aspeed: Rainier 1S4U: Fix fan nodes
      ARM: dts: aspeed: Rainier: Update to pass 2 hardware

Konstantin Aladyshev (1):
      ARM: dts: aspeed: amd-ethanolx: Enable all used I2C busses

Paul Fertser (1):
      ARM: dts: aspeed: tiogapass: add hotplug controller
