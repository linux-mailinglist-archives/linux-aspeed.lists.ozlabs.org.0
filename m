Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF223CCD1
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Jun 2019 15:21:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NVyq0pFbzDqZX
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Jun 2019 23:21:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=alien8.de
 (client-ip=2a01:4f8:190:11c2::b:1457; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="KCHvj3ZY"; 
 dkim-atps=neutral
X-Greylist: delayed 526 seconds by postgrey-1.36 at bilbo;
 Tue, 11 Jun 2019 23:21:45 AEST
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NVyd2y1gzDqYk
 for <linux-aspeed@lists.ozlabs.org>; Tue, 11 Jun 2019 23:21:44 +1000 (AEST)
Received: from zn.tnic (p200300EC2F0A6800DC92A88D55C2D513.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:6800:dc92:a88d:55c2:d513])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E82661EC0911;
 Tue, 11 Jun 2019 15:12:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1560258755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=EJ7VR9sUEWWF+ZecbxZGX04se8PAYDXjUb4dY5s/kD8=;
 b=KCHvj3ZYpkLfnoRKsXFvWYlmUSfvoaj1TEiKYWgNhqglSi/LYCDwov/V5k+8SIjqzvJoMI
 qIddH3YStkbgi4BPh7zrK+4/pIcOUOr/iFNHx27X3sBpwtEhkx8MCdrSE3yRUHWd8GXORE
 2cxFoWi7Lw3vA5Z/gUeITH0YYX8UOo0=
Date: Tue, 11 Jun 2019 15:12:29 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Stefan Schaeckeler (sschaeck)" <sschaeck@cisco.com>
Subject: Re: [PATCH -next] EDAC: aspeed: Remove set but not used variable 'np'
Message-ID: <20190611131229.GF31772@zn.tnic>
References: <20190525144153.2028-1-yuehaibing@huawei.com>
 <04f103fb-54b1-4911-8164-44b20bfd1e72@www.fastmail.com>
 <960D5667-41E7-47F3-9C0A-726CA919B82D@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <960D5667-41E7-47F3-9C0A-726CA919B82D@cisco.com>
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 YueHaibing <yuehaibing@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james.morse@arm.com" <james.morse@arm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, May 29, 2019 at 03:10:54AM +0000, Stefan Schaeckeler (sschaeck) wrote:
> On  Tuesday, May 28, 2019 at 6:27 PM, Andrew Jeffery wrote:
> > On Sun, 26 May 2019, at 00:12, YueHaibing wrote:
> > > Fixes gcc '-Wunused-but-set-variable' warning:
> > >
> > > drivers/edac/aspeed_edac.c: In function aspeed_probe:
> > > drivers/edac/aspeed_edac.c:284:22: warning: variable np set but not
> > > used [-Wunused-but-set-variable]
> > >
> > > It is never used and can be removed.
> > >
> > > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> >
> > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> 
> Reviewed-by: Stefan Schaeckeler <sschaeck@cisco.com>

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
