Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6D098694B
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 00:58:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDXFg6411z2yTs
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 08:58:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727276861;
	cv=none; b=HDVsuqPuJBIKMvXmoszC9Ai8aD0C1sJmhPnuhula9IsNvuvuTJ/e6KnJX1oWFeEDx4srNal+v/hQHhRSg+5kdogqBq7yIf9wQAeGMPuWMTGxVPal3xJS/pUg0SUVcJfKraGUVXUWi2RNdYn/sVqZSqnKMoR2wPLl8T+zrmpSr5kE8h1GuOMnjmJ+rrwxLl/vVYIxeWhj+cU2Gj0pJHb60TLICPWH9XBT+TXr6y0vHyWsEeFPgGILmhzC+pL+EitdpWmWdzDxWofjdQzHz4gYEPH6NCKzP+mkSpqLfeyJdqh5ihFmaZBR3gWK2j3jPCbmZzt3JYVdPr3jKSSMh8KNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727276861; c=relaxed/relaxed;
	bh=DWF83HMoN2Ea7DGvk+6V2CllZTFpJS9ca4WBd4vItNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=muTI/5Q7PtqfowEE4Bcuf7UHT8bW3AFCJedbU0ocbvArgAvpAlMBsaX18DxARDueozZw3pAwn1sDsZoYoJax3aYbWYwU77UbkIy0hp1OgEmigi1LUBs4fA2fiQ/gd4SxO7Ih4eq5cMWauF+LLQzmBoI0pdeN+Vmptq+WuNjsBO6xyINf07nRniAaBx0xghDsWC4Ih5iUVwC+ratS254h8hVPSFZByCBnm4RpNePtvlB9vXomxNUysjTh1zq+jRnn1FQwswY5ELOVH/hIQhQibXYCjD/v5/pDlPwOQCXP2T18cL23rrq7jQHJmSRlq/LmGCPbzcroR6UM878k3Ikuyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=INRtn2Cy; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=INRtn2Cy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDKph3knkz2x9T
	for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2024 01:07:37 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42cb1758e41so56458395e9.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Sep 2024 08:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727276854; x=1727881654; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DWF83HMoN2Ea7DGvk+6V2CllZTFpJS9ca4WBd4vItNM=;
        b=INRtn2CyCmRDA5GgQXN27MLQfq/+bAH8ALHYcbea0avL+lx6oSyaAjemfRAxSZC9hN
         8eyECYdgMJIFKQAuYRUZa9flGu88qYTcYnV6F7r5tIvUnPOeB8L5uJQIjBSCrFIF8CN/
         s8Gmqg6zgW5srqpbBF/UkWvLEkekHFMM3yDQ9yIzwjr1UvbHP2uZzxYRt9UhVEo4gqTl
         dDez9xBuK6le7xheHLRehpoo/WrZ/1mHaC2czJZs74m2ycS9lxl6BQRYng9wjfFib7vY
         ito3TgkTDBY+YSIcM4jt8Qq3YcGaamp/uC8fo8Xf5zVZwHHaW+KCku2ceeGCBUxXUh9X
         RiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276854; x=1727881654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWF83HMoN2Ea7DGvk+6V2CllZTFpJS9ca4WBd4vItNM=;
        b=XqQY7dzg3E1BAH6upX+jvgHiBzJMfMq9GMDSwxy9pLkW9mTEZ75ZW3FKgnESmYXh1A
         8/hU8WAcVaEVy/YeSILl1XPdmVfh2TbZTP9EWhZA78t9UxtNbnko90QPtiYdpmuBhNdI
         1ISCuIArINhVtt1YaHfd5rWgl72zMUCTkPPBX75CYCUzHGcJsIvVthDCieMdIdCKLWtz
         hAdHhKUMtakwOnUZNVZX1+n+tSzMSYAIlbmOofMtXQt8eptCldTJJPm5qVz08Uh/A+qX
         i9YC6yp1VxhRdfxO5j1XkTaWWUF1RngkOcmnJgneJ8EBtZzpexTViSHsQQ6J1lVW6CSl
         IXUg==
X-Forwarded-Encrypted: i=1; AJvYcCUaOB+N7qNa4qfcflKl4UIT19a1zMPrsQYj/jc8vLMaNjnZNemTV815k6RvKa5YOFmq9DTmCKCvIyLcG0o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwTBMyi3CEXqm44CTyJY/+Q6rO3LcOIXJLYXxjAOPujpGTUpE91
	fXeV3JmN9N5nB9p58SAusF0tLhzb23yI6mWZXu+Muo0zajTzeE8N+gRcEXfXFWE=
X-Google-Smtp-Source: AGHT+IGip3sOgl+bQOmdyqaao7YVehMer8d8+AYC1VqOmcY2i0t8OPHuGhScpGVwZxC3FqSYI+aIsw==
X-Received: by 2002:a05:600c:470e:b0:42b:a7c7:5667 with SMTP id 5b1f17b1804b1-42e96144a7cmr19014655e9.25.1727276853820;
        Wed, 25 Sep 2024 08:07:33 -0700 (PDT)
Received: from localhost (amontpellier-556-1-151-252.w109-210.abo.wanadoo.fr. [109.210.7.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm21474945e9.43.2024.09.25.08.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 08:07:33 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:07:32 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lei Liu <liulei.rjpt@vivo.com>
Subject: Re: [PATCH v3 1/5] usb: aspeed_udc: Use devm_clk_get_enabled()
 helpers
Message-ID: <zi5lq44bc4vd33y42zkmn7hr7rw64wfxe2rvuvkekola6ctckc@buv7ybvq5skt>
References: <20240826081900.2284-1-liulei.rjpt@vivo.com>
 <20240826082140.2311-1-liulei.rjpt@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6dsn6gbwes7baogl"
Content-Disposition: inline
In-Reply-To: <20240826082140.2311-1-liulei.rjpt@vivo.com>
X-Mailman-Approved-At: Thu, 26 Sep 2024 08:58:14 +1000
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
Cc: opensource.kernel@vivo.com, linux-aspeed@lists.ozlabs.org, Neal Liu <neal_liu@aspeedtech.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--6dsn6gbwes7baogl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Aug 26, 2024 at 04:21:39PM +0800, Lei Liu wrote:
> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc=
/aspeed_udc.c
> index f4781e611aaa..a362e31f7550 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -1459,8 +1459,6 @@ static void ast_udc_remove(struct platform_device *=
pdev)
>  	ctrl =3D ast_udc_read(udc, AST_UDC_FUNC_CTRL) & ~USB_UPSTREAM_EN;
>  	ast_udc_write(udc, ctrl, AST_UDC_FUNC_CTRL);
> =20
> -	clk_disable_unprepare(udc->clk);
> -
>  	spin_unlock_irqrestore(&udc->lock, flags);

Isn't it broken to call clk_disable_unprepare() while holding a
spinlock?

I guess that means that the remove path is untested in practise and this
patches fixes a sleep-in-atomic. IMHO this invalidates Ulf's concern in
his reply to the cover letter for this patch at least.
 =20
>  	if (udc->ep0_buf)
> @@ -1500,16 +1498,11 @@ static int ast_udc_probe(struct platform_device *=
pdev)
> =20
>  	platform_set_drvdata(pdev, udc);
> =20
> -	udc->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	udc->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(udc->clk)) {
>  		rc =3D PTR_ERR(udc->clk);

An error message here would be nice. Something like

	rc =3D dev_err_probe(&pdev->dev, PTR_ERR(udc->clk), "Failed to get clock\n=
");

should work.

>  		goto err;
>  	}
> -	rc =3D clk_prepare_enable(udc->clk);
> -	if (rc) {
> -		dev_err(&pdev->dev, "Failed to enable clock (0x%x)\n", rc);
> -		goto err;
> -	}
> =20
>  	/* Check if we need to limit the HW to USB1 */
>  	max_speed =3D usb_get_maximum_speed(&pdev->dev);

Best regards
Uwe

--6dsn6gbwes7baogl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmb0JzEACgkQj4D7WH0S
/k7BAggAkHqZteCrETJY7VyuZN1rZlaLtOcZtOwWhGS/VU77rZ3XggeRv3m4vC47
hPTn3yyiJND47OJu6fIC9tSLUrY8K1HNI1kZ03J3SiDOrPevc0wzDlNITQCENVL4
Nc4lAtMYR1ZfCzNJ7+MK0PXCHZGkREp7DF8RLnvp2EOqdSadL6ZOexvONaOp0z2w
fI+4yzo1++k7+EBuSnnL7xVwk+T55OezIBpcy0cLeQRgcjOrbhPd7Evo8VtyGLAe
ZkZW3RhxSAIMpu1Kux0lFaFV+0Zp+piZSwYUIet5L87cJhdOy5gKFnSDTQp1U+tk
RwwyaG8WrFuECHX+T+NlpPRYc0btYw==
=rUO+
-----END PGP SIGNATURE-----

--6dsn6gbwes7baogl--
