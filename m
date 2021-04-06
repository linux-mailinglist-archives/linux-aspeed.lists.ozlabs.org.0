Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF87355541
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Apr 2021 15:34:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF7mW3Hsnz30BF
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Apr 2021 23:34:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=knu2bNyK;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=knu2bNyK; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF7mT228Dz2y8F
 for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Apr 2021 23:34:32 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id n8so4024004lfh.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 06 Apr 2021 06:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jfELxhLa2jf8lj10pbubktTMfsQTY9avlQlTjAXXxHY=;
 b=knu2bNyKEuX1p5cvPzyMd3Ye7+sj1nuJ8dISCbzkJI5VnRKk4KzE2qF6GFI5+tgzKX
 0aoUntjS3KMf7MvPqwxGOKSPyn+gc49YEzGciDRsrAS2+CvBTueFLux9sUbMdbeuGpsU
 J53UYJOtAm3unB1WBl+jdNoCiConqRZiLHhwbjkJBzQUdRj97HbbpQMz7oAja/eocWoN
 T8DJJfOqLxsI/UE1rnfSEUBg5puPG11MdnTp/WeU984J2drSmkXbeewXogMNRpbbrQyH
 caF/93QoOkijk52Ij7iwMTpUk48YeaLSy60QUvlWfRnMVxoYeh07jQ438pw/Zmdye1Bx
 F6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jfELxhLa2jf8lj10pbubktTMfsQTY9avlQlTjAXXxHY=;
 b=iXd75xX72hSkGS6tMm7iTUjYO55oY83iJih1p2eCR7BoeVUid6Tkwiw6bp/+Xe4opg
 rJmUgSnflp5ri3bUXr4wf5AZGnkVdH9UU0PNYtX6xrT7gYv3oNRjP+X6CUjPzgMNUy6L
 iZWNNMObCzxmi744711goJgkrIFYWWj7fKYCGA+gLRH8BzTJG5xdTF7BFbNWplpKuP2t
 /TbJaXCFWvCXPYskTyBmQUmY1WZ81xNghk51D/ImU/JFwv9aCMHkUp4e4F7/zwRwR7uk
 deGpMTeTvlty+D5rKOwq5Zc+ZcvvmXPQ12/UxIoEmaBk9KwHv7TWECFKTUBX24l/h02h
 dEsw==
X-Gm-Message-State: AOAM533lAhX9WMNBTTJ8jNbeMv4mQisBFtkm1sCSYknY4H/8i+vuuIx0
 hOjPYJkAYA4xlBfYJmfbCbI=
X-Google-Smtp-Source: ABdhPJyNNQx3yirCwBmkU20PgUiOqZScDo3PpPbHCSporh2uMB/Ym14zYpDJ/0Obk4uMEDdOh5HrPg==
X-Received: by 2002:a05:6512:3484:: with SMTP id
 v4mr20736878lfr.137.1617716064777; 
 Tue, 06 Apr 2021 06:34:24 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id h10sm2157220lfc.266.2021.04.06.06.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 06:34:24 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 136DYLgT032012; Tue, 6 Apr 2021 16:34:22 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 136DYLZu032011;
 Tue, 6 Apr 2021 16:34:21 +0300
Date: Tue, 6 Apr 2021 16:34:20 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v29 0/6] JTAG driver introduction
Message-ID: <20210406133420.GY10267@home.paul.comp>
References: <20200413222920.4722-1-ernesto.corona@intel.com>
 <20210115104635.GA2971@home.paul.comp>
 <YGxgfFBUr6eHJ1Qi@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGxgfFBUr6eHJ1Qi@smile.fi.intel.com>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Ernesto Corona <ernesto.corona@intel.com>, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Andy, 

On Tue, Apr 06, 2021 at 04:22:04PM +0300, Andy Shevchenko wrote:
> On Fri, Jan 15, 2021 at 01:46:35PM +0300, Paul Fertser wrote:
> > I have to note that the current v29 version of the series is broken in
> > several aspects:
> 
> Is it correct that this series is actually abandoned so far?

I have an e-mail from Ernesto sent on 10 Feb 2021 stating they're
going to continue the work.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
