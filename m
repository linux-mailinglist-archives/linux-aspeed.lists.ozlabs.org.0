Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC5296F473
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 14:42:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0bTT1Xb1z3c97
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 22:42:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725378607;
	cv=none; b=D2J3AB739+CBThi49+xUnZQO/j2WuJKnyn/Nue1UM7Q0skWr1HURvgxnWjUZT2zkMSppqiRoAK4ZAhSITcNm/t9L4mCK1dA6GdyF3PIyoxFH43fIKJym7w660pcegAFWgxRWkRZQpP6K/1WRKxxfvbCmMn0vVavBgC5djk+7CaCJYKy4JHcOabbtfib9PnZ46x6Ef9gBXV93RwRyt/mXVvWBRZp4lYhwBxFAy9EWxYLkMD6ZIjip90XXcy0Et9ZHWvEnWiALOIVBTEFhy3Xi/YvNNxD5gIvW3WbWOqjyZH8oAPm1jRvh+BqXLNQIe2cqjJH8kpid+YMTSZLnD0EDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725378607; c=relaxed/relaxed;
	bh=aFhHwW1kAAGcV7OaaSbrjXWw+zX1uM2EQ/+cB02HHBY=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=VHlU4Xqm/6i4zIEeMDisAjSbkIDO/n2GNj/eG/1MJjV9JUsJlTScdTxZMgOgpfcfTmHwljrwB1Nwo6oluZ6jlnPM0ZX1NCF+yxgwDkYqYDXRAfZZo4WDfFf5M2cMp1I1IlOeOoii7GdpNZY23Ckgs3dpqTVCrOC9moUc8GXYMWuzGrmV+0ivZsFnpIsCqLzY4ZoyFXzrmNB9BBXmwATYOzAwJyo70TEI30DorWpNtx9YA3RvbhtZQIGF8R3yC4yTQ3VAgJ9jgMXQbGQJxUDBX3y9iq0c1H/xL9XeKav6F5IDKuLlbqbOqaOeKd0nSdu9IxQl4qyluVLnOpBGiVgEBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=VHPrB+xo; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=VHPrB+xo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wyqnn69Vbz2xsK
	for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Sep 2024 01:50:03 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a89c8db505bso351515066b.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Sep 2024 08:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725378598; x=1725983398; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aFhHwW1kAAGcV7OaaSbrjXWw+zX1uM2EQ/+cB02HHBY=;
        b=VHPrB+xomALJfMHy7ijyCVUQfQ4LA0py1OJV2BdIMZWUCWVnJORWToip4vfIvBzHjH
         bAYXVpsfZ4jSqS2/O5O8lCf5olhnfE3wcA5MiHb72Epi8fVah4MCHXxmQ9+eta73qDth
         D8Bway+NtbsaORNsnBd1Mw3IN9p9/pjKEzhV/2FrzdWVNyu7FATBHppX7/rPmixDHsmH
         H7YDZ+KNvaDj75dYiWV2S2eSToRg9Cqc+2FLZ8NRfWluApHYX9Up8+Py0lY9Ze0L3rf0
         uCcFsCJOTKQVZMG9UB4f83dbgBTTs5MYB8RmwiaNjVS86FL3Z5mrzgTeei2E6faT113B
         argg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725378598; x=1725983398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFhHwW1kAAGcV7OaaSbrjXWw+zX1uM2EQ/+cB02HHBY=;
        b=O2a0UiyCx6hsfuiGCL35FoAdpUzGYSSjE7J2827TUJGGcaECOZfej2g3bCWnVfhVMr
         nxWWawPnZXoCzIZDvl2r2Zp4O1+aBtXoLIa8i8AhYhZ+mMRoKwGFffRQuT+SUSb9QuQz
         qvltKvUK9vYZZ726yH+E+qPJOljTXPgMqe7WG1zsYkQbV2BtjOwu3pU+QU4QBqdTVti9
         T0rmiYbxxNHSohIIS7CWOv7OHO2rv1VUdWeJkSX7UkzVHOC1faGBB0FTS3xm9WnFCVkp
         AfySapyBV2TpTKLfX7HCMscmSQ9zbTJSf8lx7+lAB3BM+DG3JHRzcpw9HLk/6h67WGNi
         TRbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmyAkJmjRwhSFp7bxIrmB/Iu+rTnkAQyi3uqiVXyXmRXZC5RH5SQSrwJFtNZeKCjQ+/JfXJSYxa7VqMIQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxRoyPhIaQ1Yf53agoGxE7s3V9BIXn5PPpt8vZHIcuMVRGqxnUj
	D5PSnD/9hsaB9Q+HaIcanjLgMVbooS+fPw8/OzV024KUwRusyNdaF09xWjRD7zQ=
X-Google-Smtp-Source: AGHT+IEvdlu/j985eM+/rA5qaBqF1lyB3uR8LKAuX5UqTugImcvkKswP9Kfp18LHlYopPINQZZ8L0g==
X-Received: by 2002:a17:906:6a05:b0:a7a:a892:8e0b with SMTP id a640c23a62f3a-a8a32e717f8mr105078566b.19.1725378597538;
        Tue, 03 Sep 2024 08:49:57 -0700 (PDT)
Received: from localhost (p5dc68f76.dip0.t-ipconnect.de. [93.198.143.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891daf9dsm695490866b.164.2024.09.03.08.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 08:49:55 -0700 (PDT)
Date: Tue, 3 Sep 2024 17:49:54 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Liao Chen <liaochen4@huawei.com>
Subject: Re: [PATCH -next] serial: 8250_aspeed_vuart: Enable module
 autoloading
Message-ID: <4nyenalsjnerwjwcuk5zwm52rptnc5jhjhz3yhsmo7qt3gffhs@qadnsjic7p24>
References: <20240903131503.961178-1-liaochen4@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oxnfsshwxceyq7si"
Content-Disposition: inline
In-Reply-To: <20240903131503.961178-1-liaochen4@huawei.com>
X-Mailman-Approved-At: Fri, 06 Sep 2024 22:42:03 +1000
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
Cc: andriy.shevchenko@linux.intel.com, andi.shyti@linux.intel.com, linux-aspeed@lists.ozlabs.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, florian.fainelli@broadcom.com, tglx@linutronix.de, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--oxnfsshwxceyq7si
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Sep 03, 2024 at 01:15:03PM +0000, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
> on the alias from of_device_id table.
>=20
> Signed-off-by: Liao Chen <liaochen4@huawei.com>
> ---
>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/se=
rial/8250/8250_aspeed_vuart.c
> index 53d8eee9b1c8..25c201cfb91e 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -561,6 +561,7 @@ static const struct of_device_id aspeed_vuart_table[]=
 =3D {
>  	{ .compatible =3D "aspeed,ast2500-vuart" },
>  	{ },
>  };
> +MODULE_DEVICE_TABLE(of, aspeed_vuart_table);

I wonder if you found this entry missing by code review, or if you have
a machine with that UART and so you actually benefit.

Otherwise looks right to me.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--oxnfsshwxceyq7si
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbXMCAACgkQj4D7WH0S
/k4lmwf7B8rCxzF0mqdiYNNkbNIL3ffkntFrgpHxTr7Sgi7iSyeFIXO7tcZuG+5a
2cit024915U223OcuPwrk/CSeOWMVzLMcOMeHtcw/45I4oFNOsP30p+0AiDVGrqg
+iOyyaK2sFMVHfp4yu1NlYaM64Ez2aW+bKrvaNWjI1vK0S1/rpdGvzTcqvxkrW8i
sKXg+rOE2QPCSliNu0t6goxHQOGMOnhrloktKH/+k/8/FjVpJ6KTNLqdogSmnycn
qbkruy1osW223l8UfYtw55w8idpmZmJCSePvmRrePJx3j3IMLKrzD8vROhpP2j0Y
s8lqi37r7SkeGx++B5ny1hfeBp8VJg==
=dQsN
-----END PGP SIGNATURE-----

--oxnfsshwxceyq7si--
