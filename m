Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F5880F568
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 19:21:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Hvpe40Xe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqRkl3XBJz3bvX
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Dec 2023 05:21:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Hvpe40Xe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqRkg2M2pz3c13
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Dec 2023 05:20:57 +1100 (AEDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1faecf57bedso4328708fac.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 10:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702405249; x=1703010049; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDE81kuOGXddlPQChxv8quZusCqlbynJ9UhLrlhz+O8=;
        b=Hvpe40Xe1BbeY+BCDm+sGWTOmDvIqWgBQ/k1dXeQGPKBw7j7km71uzkMqwZmEGyE+B
         LYq2cG8SOQcqQlIly4QkXHJ4tlxFOr2K0GjXlMtcaC55peO8hI9SarqYioQVDJCJoRBM
         VKDaFYmJX9o3RKCx5KcfSwi4MhSD1PseloWoSiHE/bj+keJJXomm5QZYPtJtBVON5miP
         NC4V3wnl7dn0RgB8uM5TpYZFkZBw2wvPxc315iX5FHcgn7rtwD2ZUvTp4T/GKF5UvG7j
         +51B3XK2STcnZ4O/yIjhGLBRwpr+sC7z4xEZHRcRQ1SI9tc5ZI9dsMI5wRPR7MBvNAb8
         tj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702405249; x=1703010049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDE81kuOGXddlPQChxv8quZusCqlbynJ9UhLrlhz+O8=;
        b=wELVSYjwcXgWVZB8DC1FmmA0paFWumfB0gdfyzBOpvJ1G89w/jeBCMiWk5mbzjSCTq
         WM5E+Xd8EqR7DNGz/+RCxo3+Mu3p6zkvRceGaQcK4RvYfUG36mjTmKBAr3LCy/R52Q28
         eB7PpDf4MM+pTTvGZeHKxo9vtXeH7ePsCZgY8vLIxF9y6ReN9Xj6gVbQFnRGnd9VCJWC
         pjQRMoD5SwY8VzxPR6wdr5aj4Vp37LqZ6AoX6k6/4pyUrJPjWpIZObpNDvQ9EkuSomTy
         594PfZJ5QbQ8tOOC2UUWxeKDrXYIRUkCSNKRfy0reUYiCQHs4Ekyt9r+OxYm530tuq48
         qLyw==
X-Gm-Message-State: AOJu0Yy0kXPOsFWduGK9ZwaRcikj+5oeHcfgrFpoffdjWKGi+7gJ0Kch
	AWhgc+w6+En6PdJwIdBD4Qg=
X-Google-Smtp-Source: AGHT+IGXLWFXupo/tm4tBeTHuC5qUcoL4NqHg6JPGuiyBNYPVPEE1uHva1Z0E6nslMmzhakP+HwG5Q==
X-Received: by 2002:a05:6871:798a:b0:1fb:dc3:782d with SMTP id pb10-20020a056871798a00b001fb0dc3782dmr7720211oac.55.1702405249374;
        Tue, 12 Dec 2023 10:20:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id wd15-20020a056871a58f00b001fb21cee425sm3338823oab.40.2023.12.12.10.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 10:20:48 -0800 (PST)
Date: Tue, 12 Dec 2023 10:20:47 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v1 2/8] dt-bindings: tpm: Add schema for TIS I2C devices
Message-ID: <874d4416-86e5-48cc-9c84-97357e4caefe@roeck-us.net>
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
 <20231212164004.1683589-3-ninad@linux.ibm.com>
 <20231212-amusement-elevation-28e42bcccc35@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212-amusement-elevation-28e42bcccc35@spud>
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
Cc: festevam@denx.de, linux-aspeed@lists.ozlabs.org, alexander.stein@ew.tq-group.com, naresh.solanki@9elements.com, johannes.holland@infineon.com, linux-hardening@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, peterhuewe@gmx.de, patrick.rudolph@9elements.com, peteryin.openbmc@gmail.com, jgg@ziepe.ca, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, conor+dt@kernel.org, keescook@chromium.org, broonie@kernel.org, lakshmiy@us.ibm.com, bhelgaas@google.com, geissonator@yahoo.com, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, linux-kernel@vger.kernel.org, gpiccoli@igalia.com, jarkko@kernel.org, robh+dt@kernel.org, vincent@vtremblay.dev, linux-integrity@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Dec 12, 2023 at 05:14:26PM +0000, Conor Dooley wrote:
> Hey,
> 
> On Tue, Dec 12, 2023 at 10:39:58AM -0600, Ninad Palsule wrote:
> > From: Johannes Holland <johannes.holland@infineon.com>
> > 
> > Add a dt schema to support device tree bindings
> 
> "Add bindings for..."
> 
> > for the generic I2C
> > physical layer. Refer to the TCG PC Client Platform TPM Profile (PTP)
> > Specification for TPM 2.0 v1.04 Revision 14.
> > 
> > This includes descriptions for the Nuvoton and Infineon devices.
> > 
> 
> > OpenBMC-Staging-Count: 3
> 
> I have no idea what this is, but it needs to be removed from the patch.
> 
> > Signed-off-by: Johannes Holland <johannes.holland@infineon.com>
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> > ---
> >  .../bindings/security/tpm/tpm-tis-i2c.yaml    | 50 +++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml b/Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml
> > new file mode 100644
> > index 000000000000..de1e34065748
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml
> > @@ -0,0 +1,50 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/security/tpm/tpm-tis-i2c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: I2C PTP based TPM Devices
> > +
> > +maintainers:
> > +  - Johannes Holland <johannes.holland@infineon.com>
> > +
> > +description:
> > +  Device Tree Bindings for I2C based Trusted Platform Module (TPM).
> 
> s/Device Tree Bindings for //. Doesn't dt_binding_check now complain if
> you have this in a title or description?
> 
> > +properties:
> > +  $nodename:
> > +    pattern: "^tpm(@[0-9a-f]+)?$"
> > +
> > +  compatible:
> > +    oneOf:
> > +      - description: Infineon's Trusted Platform Module (TPM) (SLB9673).
> > +        items:
> > +          - const: infineon,slb9673
> > +          - const: tcg,tpm-tis-i2c
> > +      - description: Nuvoton's Trusted Platform Module (TPM) (NPCT75x).
> > +        items:
> > +          - const: nuvoton,npct75x
> > +          - const: tcg,tpm-tis-i2c
> 
> > +      - const: tcg,tpm-tis-i2c
> 
> IMO this should be removed and this fallback should only be used in
> combination with device specific compatibles, like you have here for the
> infineon and nuvoton devices.

As mentioned in my response to the other patch, "only" isn't sufficient
since the tacoma devicetree file only references the generic entry.
It would also make support for chips from other vendors unnecessarily
complex.

Question should in my opinion be if the non-fallback entries are really
needed.

Thanks,
Guenter
