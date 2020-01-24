Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CAD148F5F
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jan 2020 21:29:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4849jP5sKQzDqhH
	for <lists+linux-aspeed@lfdr.de>; Sat, 25 Jan 2020 07:29:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=yI/jzlDh; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4849jG45ZhzDqgC
 for <linux-aspeed@lists.ozlabs.org>; Sat, 25 Jan 2020 07:29:22 +1100 (AEDT)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 22D7D2072C;
 Fri, 24 Jan 2020 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579897759;
 bh=F90xNfUKvOUf2TUGknbgCQUyvynq64EpI75k+l0dmfU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yI/jzlDhjyDiy+RVAtgnDZBV+QQG7xN523HkaCfjRn/esAhwjMsYmny4VGRPuJJnH
 FCupkgTKE5EWoMbbta1nqGJ4EDxd3/Oud4h9zPl9tj5gAz/ZP0vlKW8owqg5ZjPahS
 3jEuqgDRFBjJyAdXsJ8wE6TyJOoLeka9N7XUB1QI=
Date: Fri, 24 Jan 2020 15:29:17 -0500
From: Sasha Levin <sashal@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH AUTOSEL 4.19 05/11] ARM: config: aspeed-g5: Enable
 8250_DW quirks
Message-ID: <20200124202917.GI1706@sasha-vm>
References: <20200124011747.18575-1-sashal@kernel.org>
 <20200124011747.18575-5-sashal@kernel.org>
 <CACPK8XeGLW6cm9UV7gqrOF18BzsRBppzLQLY6G=Y2MDj2Yrnhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACPK8XeGLW6cm9UV7gqrOF18BzsRBppzLQLY6G=Y2MDj2Yrnhw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jan 24, 2020 at 01:21:40AM +0000, Joel Stanley wrote:
>HI Sasha,
>
>On Fri, 24 Jan 2020 at 01:17, Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Joel Stanley <joel@jms.id.au>
>>
>> [ Upstream commit a5331a7a87ec81d5228b7421acf831b2d0c0de26 ]
>>
>> This driver option is used by the AST2600 A0 boards to work around a
>> hardware issue.
>
>This hardware was only supported from 5.4+, so I think we can drop this patch.

I'll drop it for 4.19 and older, thanks!

-- 
Thanks,
Sasha
