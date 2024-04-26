Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B4D8B3A4F
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 16:46:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OE5tMCyo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQwWr2p3Kz3cYZ
	for <lists+linux-aspeed@lfdr.de>; Sat, 27 Apr 2024 00:46:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OE5tMCyo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQwWf6rXNz3cWZ
	for <linux-aspeed@lists.ozlabs.org>; Sat, 27 Apr 2024 00:45:49 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-41adf155cffso15914335e9.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Apr 2024 07:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714142744; x=1714747544; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VifuJ+1YpDUjiXq0nfZBSyvnXA3hWnQhVXai5Y/kXGQ=;
        b=OE5tMCyoAXI5EtKe5yS945MjdugJLj+orQ4m2MKI6TeceqOxAUT2/wOLd660cf7Ht6
         yw45H08nL5iHfUSofPBP0oXTE2HI/kGjCV7z57G0mAn3BSCuq6UM6ilmyNHDcRHN9qOS
         yN1kbrGvJ3t0Ih9XUm3VgbDKuDe9XGSWGt+uQYkj6GqiLYM9x/7gQL3soG/aX9weQaIy
         y5lhZtmeBILWQ9ma4nerkT+qJOoWuXxiQKKLso142pYw0pw5tr0ll8yhcXpMUonP3QBZ
         9HdWrSmZYQP9LAu6wRhgQKHljcNWss7S/jZuqiHD126d4wXpPyHHsne8zBJiHCvlH0M2
         O7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714142744; x=1714747544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VifuJ+1YpDUjiXq0nfZBSyvnXA3hWnQhVXai5Y/kXGQ=;
        b=G7z3/ZhrSAKXWpEaFnMANQqxSslwQhefnizM07h7Z5+qLc6RwhN54uk0d6CLwqv/tX
         G5j2Gjg/xNX7TTk/ZUTfrUzVv2OW0tYS6ZudBPxoyigKHrtdl5YW6wb1hE1p2QcSyFZP
         Yap8bGr7PbjbNL8Q21IvGjLl8o6mX8xvoyJwiZEDxqmoCv8eLoysXPTEAuemfln/Hfzu
         NFGRHnhRU6a1AIIbh7PdsDNOmte5OgryDSVc/YPLfpyJM0vAtMgqzzTrsfzJ7NsQeVmf
         vHB5wytIA71WfX7+1lapnjXik7+/YLO33bWSHH29hkoXWS/rbm44Upnvqx+p/ikddW+N
         jWTg==
X-Forwarded-Encrypted: i=1; AJvYcCUqM3/jfVbLHi+2De3lldqa57hcqk7gwe56bjyVKtoYXP11C+tPIU0FyjX0LtedOUkWGB7FtCvU1tl6CVDyU2WQldqLft2Gh3i5UjJGOg==
X-Gm-Message-State: AOJu0YxQ43cEgzAOnKhA/7AQQ5FUHKV2oQCyIATokJqwXxfqn23mCpk/
	uGmaAtMg309cDZTOo0wYik/7RMDFiHIsifSjQmADSOb1wHe4BSPwCVhkzvnSi9UktgxizzhNoR+
	IUL/IwobVcoZr+FnIRvrbbzvRenI=
X-Google-Smtp-Source: AGHT+IHIIDds8VIXhbA/z3xYSMfozMo9ODJUXJjglU5xk+l6mvMJjvBSWWAy44MjiApfAmP3l+6ZOrN2bnn+Tq68ovU=
X-Received: by 2002:a05:600c:45cd:b0:41a:a521:9699 with SMTP id
 s13-20020a05600c45cd00b0041aa5219699mr2249699wmo.4.1714142743502; Fri, 26 Apr
 2024 07:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240425090727.3787160-1-peteryin.openbmc@gmail.com>
 <20240425090727.3787160-2-peteryin.openbmc@gmail.com> <5ed8bfd6ce559a7d00ec89f1bd7ae1aea90e3ae7.camel@codeconstruct.com.au>
In-Reply-To: <5ed8bfd6ce559a7d00ec89f1bd7ae1aea90e3ae7.camel@codeconstruct.com.au>
From: Chia Hsing Yin <peteryin.openbmc@gmail.com>
Date: Fri, 26 Apr 2024 22:45:32 +0800
Message-ID: <CAPSyxFTa6k3FzUmDoZ6HMpAfwZGK_yPrQKGSvSdtj_JqsnMVrA@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] drivers: watchdog: revise watchdog bootstatus
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

I can include reset condition in struct maybe like this

static const struct aspeed_wdt_config ast2600_config =3D {
.ext_pulse_width_mask =3D 0xfffff,
.irq_shift =3D 0,
.irq_mask =3D GENMASK(31, 10),
.compatible =3D "aspeed,ast2600-scu",
.reset_event =3D AST2600_SYSTEM_RESET_EVENT,
.watchdog_reset_flag =3D AST2600_WATCHDOG_RESET_FLAG,
.extern_reset_flag =3D EXTERN_RESET_FLAG,
.reset_flag_clear =3D AST2600_RESET_FLAG_CLEAR,
};

in probe( ) we  just call

scu_base =3D syscon_regmap_lookup_by_compatible(wdt->cfg->compatible);
if (IS_ERR(scu_base))
    return PTR_ERR(scu_base);

ret =3D regmap_read(scu_base, wdt->cfg->reset_event, &status);
if (ret)
    return ret;

if ((status & POWERON_RESET_FLAG) =3D=3D 0 &&
     status & wdt->cfg->watchdog_reset_flag)
    wdt->wdd.bootstatus =3D (status & wdt->cfg->extern_reset_flag) ?
    WDIOF_EXTERN1 : WDIOF_CARDRESET;

status =3D wdt->cfg->watchdog_reset_flag | POWERON_RESET_FLAG |
wdt->cfg->extern_reset_flag;

ret =3D regmap_write(scu_base, wdt->cfg->reset_event, status);

Does this meet your expectations?

On Fri, Apr 26, 2024 at 8:42=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Thu, 2024-04-25 at 17:07 +0800, Peter Yin wrote:
> > Regarding the AST2600 specification, the WDTn Timeout Status Register
> > (WDT10) has bit 1 reserved. Bit 1 of the status register indicates
> > on ast2500 if the boot was from the second boot source.
> > It does not indicate that the most recent reset was triggered by
> > the watchdog. The code should just be changed to set WDIOF_CARDRESET
> > if bit 0 of the status register is set. However, this bit can be clear =
when
> > watchdog register 0x0c bit1(Reset System after timeout) is enabled.
> > Thereforce include SCU register to veriy WDIOF_EXTERN1 and WDIOF_CARDRE=
SET
> > in ast2600 SCU74 or ast2400/ast2500 SCU3C.
> >
> > Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> > ---
> >  drivers/watchdog/aspeed_wdt.c | 109 ++++++++++++++++++++++++++++++++--
> >  1 file changed, 103 insertions(+), 6 deletions(-)
>
> After this patch the probe() implementation is ~250loc with a whole
> bunch of conditional behaviours based on the SoC version. Maybe it's
> time to break it up into version-specific functions that are called
> from the probe() implementation?
>
> Andrew
