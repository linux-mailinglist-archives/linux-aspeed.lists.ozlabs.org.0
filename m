Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1212A7C353
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jul 2019 15:23:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zDdw4TRrzDql0
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jul 2019 23:23:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="lhsywEio"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zBNl4z3dzDqf9
 for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jul 2019 21:42:15 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1443D2089E;
 Wed, 31 Jul 2019 11:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564573332;
 bh=HB7/0BwaEc6sX68xTXz1CtQQ7wV3B9leYzhMeTEKT8w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lhsywEioejSN00UEopG6RZRGpzzCtCGjepv2uh53EF9BpHvvQIyBGdy3fHP1UU0yy
 H9otRSi1/0tKJpm+pfrYIX8g3foOmml8DJbaSMyjch0n2y3c+WL2S5TSZtkK+iV/nd
 2t84fxrvm6bBirJ3Tnb6mD7gD9GaVNkcHNIld+I0=
Date: Wed, 31 Jul 2019 13:42:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: sudheer v <open.sudheer@gmail.com>
Subject: Re: [patch v4 1/5] AST2500 DMA UART driver
Message-ID: <20190731114210.GA18474@kroah.com>
References: <1564147640-30753-1-git-send-email-open.sudheer@gmail.com>
 <1564147640-30753-2-git-send-email-open.sudheer@gmail.com>
 <20190730154759.GA26425@kroah.com>
 <CAE-5=DQ8p9WAhjrmZ8ye8GjoHrcxkHkjJPRNRFtvgeF5SdqwVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-5=DQ8p9WAhjrmZ8ye8GjoHrcxkHkjJPRNRFtvgeF5SdqwVQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sudheer V <sudheer.veliseti@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, ShivahShankar Shakarnarayan rao
 <shivahshankar.shankarnarayanrao@aspeedtech.com>,
 Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, sudheer veliseti <sudheer.open@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jul 31, 2019 at 05:06:08PM +0530, sudheer v wrote:
> Hi  Greg,
>  After modifying [ patch v4 1/5 ] , should i submit whole patchset as  v5 ?

Yes please.

thanks,

greg k-h
