Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7701389DF6
	for <lists+linux-aspeed@lfdr.de>; Thu, 20 May 2021 08:31:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm0Hb2RNYz2yyG
	for <lists+linux-aspeed@lfdr.de>; Thu, 20 May 2021 16:31:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=juerg.haefliger@canonical.com; receiver=<UNKNOWN>)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm0HT2HFTz2yXb
 for <linux-aspeed@lists.ozlabs.org>; Thu, 20 May 2021 16:30:59 +1000 (AEST)
Received: from mail-ed1-f69.google.com ([209.85.208.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <juerg.haefliger@canonical.com>) id 1ljcCt-0002Aa-Tn
 for linux-aspeed@lists.ozlabs.org; Thu, 20 May 2021 06:30:56 +0000
Received: by mail-ed1-f69.google.com with SMTP id
 ba15-20020a0564021acfb029038d3b33d7ffso6355470edb.23
 for <linux-aspeed@lists.ozlabs.org>; Wed, 19 May 2021 23:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version;
 bh=T8MGweMWh8G1Vb1FxsntXZZXVCiDZgcu3o7qGFDrNfw=;
 b=c9soPT4y1cSG/adNCSM5mwneuFIKqxrSaHHEh/Z6Bzx6nUVMnIlvw4ZMyp+5VzSsGF
 MBV6ECndlAMw8EQao2D+GXRBrAOvl8hDDcAjNV1CbuN9SPCwhIXxfH4ReDO8GvZOWQOM
 5hdkrJHlSK7efiHSiewy+KtOSK9MyI+0bGjSAl+tPGln1EUZqFV7V5IsfJHOaNNhh0LF
 7NVHBqvPhak291YvW2x+Bs5ZxkOftDkGWdy8w5B6NGk32q1RbIUG4NUktQ1VbK6U2DES
 J4DSy5gm8mgZ97UbqX9P0DFd0HpZ532UJFZzMougMha4r0rfPxpZK9nyHO+vPpP7Qh8t
 B8og==
X-Gm-Message-State: AOAM531/LNB0YIZual4krqWB7mtyC/nb3UUpeTZ2hhMc4pRvxwv7nDDH
 lOLBk9WCVUGSAA31F4hyvP65FCkwHbtvUnQ/KWRTvsRWASJHWuHyd0evO+0DW+5HMhChKuAZ6Pl
 wxY2nFHranTEYGfxHVsArBvdjHbnzOlzVUoXuyCl19Uo=
X-Received: by 2002:a50:ff13:: with SMTP id a19mr3255220edu.300.1621492255641; 
 Wed, 19 May 2021 23:30:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNuPb1H6GgcBejEqtfEk4G+6+0hpLo6D3PmJC9QoZVsHwbgkZ+4/XF36vpbR0o9XtSZq3ixA==
X-Received: by 2002:a50:ff13:: with SMTP id a19mr3255207edu.300.1621492255469; 
 Wed, 19 May 2021 23:30:55 -0700 (PDT)
Received: from smeagol ([194.191.244.86])
 by smtp.gmail.com with ESMTPSA id fb19sm882547ejc.10.2021.05.19.23.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 23:30:54 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
Date: Thu, 20 May 2021 08:30:52 +0200
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] watchdog: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
Message-ID: <20210520083052.68a0e1d9@smeagol>
In-Reply-To: <f2e616645f311ccaf6e0acb996f8c4360a0480ec.camel@perches.com>
References: <20210511061812.480172-1-juergh@canonical.com>
 <f2e616645f311ccaf6e0acb996f8c4360a0480ec.camel@perches.com>
Organization: Canonical Ltd
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L_fDvoyzrJmgDY0oW_xHuS=";
 protocol="application/pgp-signature"; micalg=pgp-sha512
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux@roeck-us.net, linux-kernel@vger.kernel.org,
 Juerg Haefliger <juerg.haefliger@canonical.com>, wim@linux-watchdog.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--Sig_/L_fDvoyzrJmgDY0oW_xHuS=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 12 May 2021 21:48:37 -0700
Joe Perches <joe@perches.com> wrote:

> On Tue, 2021-05-11 at 08:18 +0200, Juerg Haefliger wrote:
> > Convert sprintf() in sysfs "show" functions to sysfs_emit() and
> > sysfs_emit_at() in order to check for buffer overruns in sysfs outputs.=
 =20
> []
> > diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_=
wdt.c =20
> []
> > @@ -445,8 +445,9 @@ static ssize_t ziirave_wdt_sysfs_show_firm(struct d=
evice *dev,
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> >=20
> > -	ret =3D sprintf(buf, ZIIRAVE_FW_VERSION_FMT, w_priv->firmware_rev.maj=
or,
> > -		      w_priv->firmware_rev.minor);
> > +	ret =3D sysfs_emit(buf, ZIIRAVE_FW_VERSION_FMT,
> > +			 w_priv->firmware_rev.major,
> > +			 w_priv->firmware_rev.minor);
> > =C2=A0
> >=20
> > =C2=A0	mutex_unlock(&w_priv->sysfs_mutex);
> > =C2=A0
> >=20
> > @@ -468,8 +469,9 @@ static ssize_t ziirave_wdt_sysfs_show_boot(struct d=
evice *dev,
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> >=20
> > -	ret =3D sprintf(buf, ZIIRAVE_BL_VERSION_FMT, w_priv->bootloader_rev.m=
ajor,
> > -		      w_priv->bootloader_rev.minor);
> > +	ret =3D sysfs_emit(buf, ZIIRAVE_BL_VERSION_FMT,
> > +			 w_priv->bootloader_rev.major,
> > +			 w_priv->bootloader_rev.minor);
> > =C2=A0
> >=20
> > =C2=A0	mutex_unlock(&w_priv->sysfs_mutex);
> > =C2=A0
> >=20
> > @@ -491,7 +493,7 @@ static ssize_t ziirave_wdt_sysfs_show_reason(struct=
 device *dev,
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> >=20
> > -	ret =3D sprintf(buf, "%s", ziirave_reasons[w_priv->reset_reason]);
> > +	ret =3D sysfs_emit(buf, "%s", ziirave_reasons[w_priv->reset_reason]);=
 =20
>=20
> All of these formats should probably end with a newline
> and the ZIIRAVE_<FOO>_VERSION_FMT defines are to me unnecessary.
>=20

I'll send a follow-on patch for that.

...Juerg

--Sig_/L_fDvoyzrJmgDY0oW_xHuS=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmCmAhwACgkQD9OLCQum
QrdOUhAAhmiMFmidekLXp9pqzm0r5JwSAY1m4G+OnbZpW9WCaxohD8bivxvVa7Xm
6EQ6SNXkM6joh9iOr0MOawpiWxD2M//Cfuy2XKMSQudbTE4TE8rDD6KbgsBxWzd4
6z82Nsd56uBA87Hrl3pVuVBHtPffIxHZGIc04GQIP24up9hZRmeZZj74trNOSdSb
Dtf0zv2qkkWsWNTolj/aVK9oIo/gRYKFYS4Y2pouUyWO9ZKwceJoKdCZtzZjIeUT
PIRyAFdd0LR4yVUxIF4pZSixNuL1o03ny5jRIBT8ToYxfS1jielPtsvlva7MWLdW
wBACWcOkS6ZvvKdYyFDBmvi/6MOwkrLzPuoVxeMitWMZKVoyKXwff8pCPOLd+IVk
qGKNjn1bNT2oi3AgDo6oA13Fl8rrkRpeJPi5aHZtmz0gs/xBsyD55l2tEBuBQREF
z6hU4+R7FUak99gLvIVDIaKqmJn6k/1fRoCKr9BokKgS9yqJl8DVxkRNXP1LfaQt
5RO5nsWLmgI5vSW2ScDa8hHBE0eGgaVaLJeRTSyreuTQFNJrAWpgu3Fc4LKUT2JR
CXyR+PFBZyNQLv4SomVOztXBN83EO4cBYFebZQF3JERAOdzy4FUvwnuDj+cq//fA
Ra6RAuVCO3+yjoIxNZVXpZiVIdPQlYeIIzBNwiSJJh06OXpovqI=
=lrYW
-----END PGP SIGNATURE-----

--Sig_/L_fDvoyzrJmgDY0oW_xHuS=--
