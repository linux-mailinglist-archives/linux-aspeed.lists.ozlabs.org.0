Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8EE638358
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Nov 2022 06:07:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJNC9631sz3f24
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Nov 2022 16:07:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M5F3AYMf;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M5F3AYMf;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHF8J3SCpz3cGc
	for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Nov 2022 19:45:52 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id k5so15336944pjo.5
        for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Nov 2022 00:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZBF8K0cqo1XxroCT8+8Aao6E/CEIYX213gx54pBiGg=;
        b=M5F3AYMfKdwI/yDiUE/h5ylmNETVyGZWyZ/9349Z8JF33+dcqqGZqi7/S71/TrBH8u
         Z9ksFb14bj1C6fcTWcFJIc5oyWrK7PY8bJ/NKG0Q/dNAkb8brpWn4Vxd+tjtnAPDS7i4
         VVZaaQZhZD2SPYjGOMSIOIF9jdcJC/K7u97Cpoa4Q12K8Gonf7TDlo6Mb48P/N5i0ZtQ
         ZZCEdWneu0yxlynMvjMqURoDhxqfWyJxdlb4leW6+9NoR6z24exhJyM2hykU74jELSww
         iA/kobUCST9W5zQ6nYxqcPFcadICLq7Gr2o3V5otoZ9mtjbmCWOg9dYoW1HZUiMgLOhn
         urrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZBF8K0cqo1XxroCT8+8Aao6E/CEIYX213gx54pBiGg=;
        b=ZbS1Y3qUe0C0BQc9S/MGHQKO7Pgj2KGFzLOIVjYH9r7Jwv3BtMeeWNqSWPGgoRhlg6
         G1lmOiWN5fSwEQqip1CgiUwckl7NAeKZaNeP+J2IsP9EebAtJUg3WwbxYdkS0QM7mahn
         WTIdQm8naaH4M3LL9gtTRJXzG86UgIRhKSgbbGII1afv5HdrpfDRbMWtV72M0kf0QhzT
         TQkL1iGxRlDqEzqDBJykuWE8nYqkDVbNhtCAislgGxw1CrF6V0DnRXojIhWSDYYXAgiL
         SOt9LDM8RHUlbcDHn9+AB3xI9o42vi14JkQ8y7WhcUsOK1MMPCfzaYb4VuL1z8xzxlrK
         MMsg==
X-Gm-Message-State: ANoB5pmhETpbrpLZbX+9AGPH3sfuQEbjhEf+tg9cvlNghL6g3c9VhEos
	ZmykvxTBupjPZveTWXEqamI=
X-Google-Smtp-Source: AA0mqf4jIwDCVAAg0TznbSNmzpqVz8yL39dOREeFq0Dhb07wOzc23GXd567FoO2yF1M+OOdwnLMlZg==
X-Received: by 2002:a17:90a:7344:b0:218:a049:cc0f with SMTP id j4-20020a17090a734400b00218a049cc0fmr17781965pjs.176.1669193149476;
        Wed, 23 Nov 2022 00:45:49 -0800 (PST)
Received: from debian.me (subs03-180-214-233-3.three.co.id. [180.214.233.3])
        by smtp.gmail.com with ESMTPSA id e16-20020a17090301d000b001785fa792f4sm13624971plh.243.2022.11.23.00.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 00:45:48 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 747DD1041A8; Wed, 23 Nov 2022 15:45:46 +0700 (WIB)
Date: Wed, 23 Nov 2022 15:45:46 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v4 5/5] hwmon: Add Aspeed ast2600 TACH support
Message-ID: <Y33duvUVQ0AJsgAv@debian.me>
References: <20221123061635.32025-1-billy_tsai@aspeedtech.com>
 <20221123061635.32025-6-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wdr+NIs+nU2Ts8sL"
Content-Disposition: inline
In-Reply-To: <20221123061635.32025-6-billy_tsai@aspeedtech.com>
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


--Wdr+NIs+nU2Ts8sL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2022 at 02:16:35PM +0800, Billy Tsai wrote:
> diff --git a/Documentation/hwmon/tach-aspeed-ast2600.rst b/Documentation/=
hwmon/tach-aspeed-ast2600.rst
> new file mode 100644
> index 000000000000..4f9501b783a1
> --- /dev/null
> +++ b/Documentation/hwmon/tach-aspeed-ast2600.rst
> @@ -0,0 +1,24 @@
> +Kernel driver tach-aspeed-ast2600
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +
> +Supported chips:
> +	ASPEED AST2600
> +
> +Authors:
> +	<billy_tsai@aspeedtech.com>
> +
> +Description:
> +------------
> +This driver implements support for ASPEED AST2600 Fan Tacho controller.
> +The controller supports up to 16 tachometer inputs.
> +
> +The driver provides the following sensor accesses in sysfs:
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +fanX_input	ro	provide current fan rotation value in RPM as reported
> +			by the fan to the device.
> +fanX_div	rw	Fan divisor: Supported value are power of 4 (1, 4, 16
> +                        64, ... 4194304)
> +                        The larger divisor, the less rpm accuracy and th=
e less
> +                        affected by fan signal glitch.
> +fanX_pulses	rw      Fan pulses per resolution.
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

I found htmldocs warnings:

Documentation/hwmon/tach-aspeed-ast2600.rst:2: WARNING: Title underline too=
 short.

Kernel driver tach-aspeed-ast2600
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Documentation/hwmon/tach-aspeed-ast2600.rst:18: WARNING: Unexpected indenta=
tion.
Documentation/hwmon/tach-aspeed-ast2600.rst:19: WARNING: Block quote ends w=
ithout a blank line; unexpected unindent.
Documentation/hwmon/tach-aspeed-ast2600.rst:23: WARNING: Definition list en=
ds without a blank line; unexpected unindent.

I have applied the fixup:

---- >8 ----

diff --git a/Documentation/hwmon/tach-aspeed-ast2600.rst b/Documentation/hw=
mon/tach-aspeed-ast2600.rst
index 4f9501b783a11b..8faa00f6ad47c2 100644
--- a/Documentation/hwmon/tach-aspeed-ast2600.rst
+++ b/Documentation/hwmon/tach-aspeed-ast2600.rst
@@ -1,5 +1,5 @@
 Kernel driver tach-aspeed-ast2600
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Supported chips:
 	ASPEED AST2600
@@ -13,7 +13,8 @@ This driver implements support for ASPEED AST2600 Fan Tac=
ho controller.
 The controller supports up to 16 tachometer inputs.
=20
 The driver provides the following sensor accesses in sysfs:
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
 fanX_input	ro	provide current fan rotation value in RPM as reported
 			by the fan to the device.
 fanX_div	rw	Fan divisor: Supported value are power of 4 (1, 4, 16

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Wdr+NIs+nU2Ts8sL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY33dugAKCRD2uYlJVVFO
o4VPAP9OVgcEc9GRXdOZWL9ta8mpZLXWh61q7ErF/EdcKKz/YwEAjFBWtmXNVi7P
XnbIMa0wezzy+QvZXMhp+uQ6u1BsdQc=
=uc2g
-----END PGP SIGNATURE-----

--Wdr+NIs+nU2Ts8sL--
