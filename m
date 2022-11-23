Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF53638357
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Nov 2022 06:07:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJNC51KZRz3c2j
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Nov 2022 16:07:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R74V8oy2;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R74V8oy2;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHF603w94z300l
	for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Nov 2022 19:43:51 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id o5-20020a17090a678500b00218cd5a21c9so1220222pjj.4
        for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Nov 2022 00:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UEqY7eSUYIrjPRbm/F0XJSLYxWUBYewQdwfH+fs0IZ0=;
        b=R74V8oy2vcORr2rvgm1i5wrIxPorzaR9tJLI0FGtoPIOFO33B8Zbypd2jkImSqh37A
         kSZqsVhGgW+LaNTJZ5jc3TDjXBKB0U6cFfMjc4i97c8U6w8BqxFIqH1AxTY3n5Ya75W1
         46+WYkEczUpeNVb510qObmcFgO3np/I59OHkVRQL8RzGqhkvG13sTRfPEGuVcNqFjenD
         rzOmeCXut1B57Lva46w45WH+c9ZM/6i3++8gdJKG8OHHZejzwqvTFHgZDZBo8jO12rS+
         0A2tMgrPBKQhatqhzmwMbGM3x5TItPt95xJTvxyZcfUSuW0qLs+6NPBeDyE4Mz2ZJGe9
         bmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEqY7eSUYIrjPRbm/F0XJSLYxWUBYewQdwfH+fs0IZ0=;
        b=ogz5VSQVrdeP0SONU7vId02Q2XSjDYb+6v/YVP+Dsj+w6iZPKmiTJ93sEpRtdR3URw
         OcXafC20w/EKo+qXGVKroFxi+ly7YiUJo7tj4lULkCpGHGfZqH6uNIVnk9Jfiy+amiyP
         eH58W3okpQ1Oeh7Z0fnNd9q7KXw0INfHutAFjU0GIeFJWDulP91Bb5yMrS9eJxBvxeSX
         qmwu29q5Q7NJJTKkwZRJV2FGuYv6L6bo9Cho4LWSegcz9TnkgoknkcQAYjw8pVH3Ucj5
         p496fsc1pYR0N6OgGAsppB7T+RIPBCaAcJLcbymjls35FEOL7AkIaFXy/WRVjpzc+l7X
         eC/w==
X-Gm-Message-State: ANoB5pkW59XR5xh4v2hDs1DZ4tYrZe+DPUGS+o7Mtenj9JTHRotKTOWj
	GD91IMO9RdOXlWT8fkPzASI=
X-Google-Smtp-Source: AA0mqf4QoiS6RD3VcBq4gMjB7ZeXjnm6haKPlDcJODzSaKVoSvZIvApR3jZFHnH8lpYomx8MAJaUfA==
X-Received: by 2002:a17:90a:d304:b0:218:8d0e:9f03 with SMTP id p4-20020a17090ad30400b002188d0e9f03mr23867092pju.114.1669193025711;
        Wed, 23 Nov 2022 00:43:45 -0800 (PST)
Received: from debian.me (subs03-180-214-233-3.three.co.id. [180.214.233.3])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902f14900b0017f7628cbddsm13487225plb.30.2022.11.23.00.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 00:43:45 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id AAB731041A8; Wed, 23 Nov 2022 15:43:41 +0700 (WIB)
Date: Wed, 23 Nov 2022 15:43:41 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v4 4/5] pwm: Add Aspeed ast2600 PWM support
Message-ID: <Y33dPbQywb5amyw4@debian.me>
References: <20221123061635.32025-1-billy_tsai@aspeedtech.com>
 <20221123061635.32025-5-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jwnDXMyFOzlbJrYy"
Content-Disposition: inline
In-Reply-To: <20221123061635.32025-5-billy_tsai@aspeedtech.com>
X-Mailman-Approved-At: Fri, 25 Nov 2022 16:01:54 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, kernel test robot <lkp@intel.com>, robh+dt@kernel.org, thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--jwnDXMyFOzlbJrYy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2022 at 02:16:34PM +0800, Billy Tsai wrote:
> Add the support of PWM controller which can be found at aspeed ast2600
> soc. The pwm supoorts up to 16 channels and it's part function of
> multi-function device "pwm-tach controller".
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Reviewed-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> Reported-by: kernel test robot <lkp@intel.com>

Why do you add Reported-by from kernel test robot? I guess the bot
reported issues on previous version of this patch series, then you fix
them, right?

--=20
An old man doll... just what I always wanted! - Clara

--jwnDXMyFOzlbJrYy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY33dNQAKCRD2uYlJVVFO
o5QOAP4hPIbr2ww0mmYXCgvWkHUFUtnqMak3T0+BC07yQq6uYgEAjFVspeDnkpyZ
p9/Fd0xJYU24ygs1zJkB0Y1IhbLHTwc=
=blxx
-----END PGP SIGNATURE-----

--jwnDXMyFOzlbJrYy--
