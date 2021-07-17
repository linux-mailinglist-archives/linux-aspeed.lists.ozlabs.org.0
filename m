Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B31C63CC668
	for <lists+linux-aspeed@lfdr.de>; Sat, 17 Jul 2021 22:55:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GS0kQ4Tcwz301B
	for <lists+linux-aspeed@lfdr.de>; Sun, 18 Jul 2021 06:55:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=yG/94pT+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=yG/94pT+; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GS0jt64kfz2yfq
 for <linux-aspeed@lists.ozlabs.org>; Sun, 18 Jul 2021 06:55:11 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id t9so14380788pgn.4
 for <linux-aspeed@lists.ozlabs.org>; Sat, 17 Jul 2021 13:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AzejeF7pARl9nvNZ/SKXjtBr8tSI+wQVjunUNUziOkA=;
 b=yG/94pT++KysRkRR7Ee9X/reRZojfKEcZDLOovFdsOCIl6tMAHuE4febS8dZjRq5on
 KakPilolQePL2d3aMUyd0sD2TpYRm3tFxj9hcX+iuHw+lTBEHfYq8POysMd5FJbVILZq
 b8CQb+EfVh6yJZzKi3jm+4bSd90uJQgsJBmJLGe3ZJSJIYCLeIkEdLUyG4qCERiR/D3Y
 CLFZxGYQ2TrtobRV/SdNOcMAnBKcFjZrQJtjrVYq7LWy4xElrWV7FvFTn060p8a4rY4U
 adR8o5Jt47WSv1Zror7vG7WmZ4dkwESOOo1I1AuekVMbzXvKduiajK3Zbz5E0/tyNsPV
 XgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AzejeF7pARl9nvNZ/SKXjtBr8tSI+wQVjunUNUziOkA=;
 b=icBEQmOvg7bigNi0fMN8k9QiDn7WSl+Nd3k5ZVwSRKd2QBwHNqPfx05oBNc9Rpdprq
 PJB21YXUliIjxtS8ikMwjbiELzS+mSLAMuyfxnb4xSciz3c6ergXbCbxo0tra2ZENDWH
 aRZFH+ddwH9O+XwUTssUxfUtLOaR1muiO7XpQsvWKt4ajqBl0hdkQ70VdWPYmIrWTxo4
 un1ORXhwzt/mbvQCheupWeDRFw/aVbu1g8ElhOwKo1grvKK45WykaLpt69U/j9cb556N
 rY6SmSCFjc2CWZ2hbxnIF4u5QkHPiimmKePur6NkIyeuJK5Lxt1DvhZxg5ewKVoxtJOG
 +8iw==
X-Gm-Message-State: AOAM531J83L3HK7Afl2I26zGDRiE38NJkqnZf3vhTVJSdNU/dPZHHPga
 CmdWWg/+pWLxCcdwgRJDuEYZuetbetj4QCd2PAattg==
X-Google-Smtp-Source: ABdhPJwegUQnpKKeNNS0aeS1tIibmSwIVu8h0HW57Wt8a6q24xYnmH9VFR5v+d9CeKf0ktP85MKfdE2UMTwvnwW1EYI=
X-Received: by 2002:a65:6248:: with SMTP id q8mr16976866pgv.279.1626555305105; 
 Sat, 17 Jul 2021 13:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-7-iwona.winiarska@intel.com>
 <59428599ef7efb2521bd62c49a3bc55c710f29de.camel@intel.com>
 <6807a14deb52956ad2fe390b1811dd98901a642a.camel@intel.com>
 <CAPcyv4ifjCZSUuk5H5qw6sjt5vdAkTfNzd+4imu+9e_iOt74gQ@mail.gmail.com>
 <YPJ05JUiOggKajIx@kroah.com>
In-Reply-To: <YPJ05JUiOggKajIx@kroah.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sat, 17 Jul 2021 13:54:54 -0700
Message-ID: <CAPcyv4iuP=uSEWyd+N65FpasQidtN82tW8q-dvf_qT7_FMiTsw@mail.gmail.com>
Subject: Re: [PATCH 06/14] peci: Add core infrastructure
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jul 16, 2021 at 11:13 PM gregkh@linuxfoundation.org
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jul 16, 2021 at 02:50:04PM -0700, Dan Williams wrote:
> > On Fri, Jul 16, 2021 at 2:08 PM Winiarska, Iwona
> > > > > +}
> > > > > +EXPORT_SYMBOL_NS_GPL(peci_controller_add, PECI);
> > > >
> > > > I think it's cleaner to declare symbol namespaces in the Makefile. In
> > > > this case, add:
> > > >
> > > > cflags-y += -DDEFAULT_SYMBOL_NAMESPACE=PECI
> > > >
> > > > ...and just use EXPORT_SYMBOL_GPL as normal in the C file.
> > > >
> > >
> > > I kind of prefer the more verbose EXPORT_SYMBOL_NS_GPL - it also
> > > doesn't "hide" the fact that we're using namespaces (everything is in
> > > the C file rather than mixed into Makefile), but it's not a strong
> > > opinion, so sure - I can change this.
> > >
> >
> > Perhaps as a tie breaker, the maintainer you are submitting this to,
> > Greg, uses the -DDEFAULT_SYMBOL_NAMESPACE scheme in his subsystem,
> > drivers/usb/.
>
> We did that because namespaces were added _after_ the kernel code was
> already there.  For new code like this, the original use of
> EXPORT_SYMBOL_NS_GPL() is best as it is explicit and obvious.  No need
> to dig around in a Makefile to find out the namespace name.

Fair enough.

/me goes to update drivers/cxl/
