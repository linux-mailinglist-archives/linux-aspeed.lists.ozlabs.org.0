Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 665FF4444F0
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 16:49:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkrnB09L2z2yHB
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Nov 2021 02:49:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d4Mc+4VI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d4Mc+4VI; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hkrn468gHz2xD4;
 Thu,  4 Nov 2021 02:49:44 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4944960E73;
 Wed,  3 Nov 2021 15:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635954580;
 bh=bIDjxKSNe0gU5T8rShkDX8CZyoiaXt8AkO97jKqHoXY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d4Mc+4VIpi6F419dPUxAWKqI/Pwhcbtmb7l41oWdhFL7Oqxf60UFPjyUKC8EeYPrN
 wUo8hY/chiX6vxe+1226af0l5UgUXWa2+5zOkLIfscpzCzvr6n1TWXbWCVyRczeU4H
 lohv7IuEYzlInkBcKpYfWyP9p0YWMv97VDWmBqOyiub0J15y+GJzBHklSeoQoAkOlK
 3G8r2R9T7uOBe+yE+puWF3h8T9CwaozLUdDDMsB2xYNQxGsBjjuvgWB1JzT5Z4U11U
 xN5F9GVvoyem9kZSwQZJPmE5YdHr8FhcbMODtCglDVIbT7sMr2tvUYeDwewAA9WD+k
 Ky2HKJ2HaPUfQ==
Date: Wed, 3 Nov 2021 08:49:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: [PATCH v4] Add payload to be 32-bit aligned to fix dropped packets
Message-ID: <20211103084939.04f6813f@kicinski-fedora-PC1C0HJN>
In-Reply-To: <CAA7TbctGtHBuVOsamFH1sQq_C5BvtsRyCM+b0Z7W=fS_eb8ATA@mail.gmail.com>
References: <20211028095047.GA15236@gmail.com>
 <CAA7TbctGtHBuVOsamFH1sQq_C5BvtsRyCM+b0Z7W=fS_eb8ATA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Sai Dasari <sdasari@fb.com>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, patrickw3@fb.com,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, velumanit@hcl.com,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 3 Nov 2021 20:41:56 +0530 Kumar Thangavel wrote:
>     Could you please review the patch and provide your feedback?

You missed CCing netdev@ again. You need to CC the mailing list 
to get the patch considered for merging.
