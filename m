Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 099A780F51E
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 19:00:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dOF8XXCJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqRHW3RY0z3bsX
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Dec 2023 05:00:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dOF8XXCJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqRHL2l8sz30Np
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Dec 2023 05:00:44 +1100 (AEDT)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6d9d29a2332so2796046a34.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 10:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702404041; x=1703008841; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCcCZYfwecxquLlX9Qk4H1uh3FlXglU8cLcEqk1Tg0c=;
        b=dOF8XXCJ8svDRmKI0rFzl9pXpwj4prN7lUY59DVyQxpY0tvMBL1WCFVRjZfuDsq7tH
         P0014dtUX8a+w3a2vDHx+TVB8C9qRJZ76Tf2z96mFqdc8p3o70eMEcWSKaTAkdm65kWj
         eTkfRwsV63cRlIMt+OQxlBDAKFsV+ReYQDFkyQxBbCTmirVzsqUkomTzMjIdXq57jJqq
         WJOTLMPADA5Rpl/yoEvfh4bWZCsf5rSmShr6WCk/csFugMdZjU/W0tKsR3MdoSMQ814p
         hjxnpy+crB01RzIFmlLcPgpd2K1gWIM1mmfDoIomf91NP4nwt0uCvpUQr1CoXdFBRv+i
         m1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702404041; x=1703008841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCcCZYfwecxquLlX9Qk4H1uh3FlXglU8cLcEqk1Tg0c=;
        b=XXk4ksWt2LW4i9tDBgKaTM1U8t0opj9y2wxIzTGGuiREUSsioFEGeBqMAsZYbfqUpR
         xCflATLMBeJ72W06NyAfuka9BAx+PN7aLABxmQGtCspgE8hAy/FaM0vr3/5AQiYtPm2O
         DWz7kTo9hpsa35gRtxl5/uUCobpescq+dzWFdUBm+aMl7zI3ILjtz1Zn7SN9XdJ1+wsM
         f7TRZ7bYywjal2jqOLFnhYjpRVjAcOZrSwt0xLX+vijCNpuso329sy5O1+OyA/7OcGow
         q+k6hmpEy2blXyOkaLM8QYWbxirvu0EO0lBA0Jos/eCw+HU2sg/kVV8c00uQmMmEO/GV
         uVIQ==
X-Gm-Message-State: AOJu0YwLbKTh0XY6OdhUS2tfeODlTchTLZknNi4Hs39j8v8E/L9bf14J
	lll5eVXqdkYFmwBTj6tit5E=
X-Google-Smtp-Source: AGHT+IFkasojfWbcCsVLi+mdn01yWMQKc33PTZwYORTSQpbYEFfSP/VEH4VMucXy6fDJEiz7YllCGw==
X-Received: by 2002:a05:6830:26ef:b0:6d9:d132:7ff with SMTP id m47-20020a05683026ef00b006d9d13207ffmr3413281otu.15.1702404041554;
        Tue, 12 Dec 2023 10:00:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e7-20020a056830200700b006d8811cbc3csm2331250otp.29.2023.12.12.10.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 10:00:41 -0800 (PST)
Date: Tue, 12 Dec 2023 10:00:39 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v1 7/8] tpm: tis-i2c: Add more compatible strings
Message-ID: <73381bb0-7fa7-4a9e-88df-ab0063058e26@roeck-us.net>
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
 <20231212164004.1683589-8-ninad@linux.ibm.com>
 <20231212-avid-grill-dbead068fac8@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212-avid-grill-dbead068fac8@spud>
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

On Tue, Dec 12, 2023 at 05:15:51PM +0000, Conor Dooley wrote:
> On Tue, Dec 12, 2023 at 10:40:03AM -0600, Ninad Palsule wrote:
> > From: Joel Stanley <joel@jms.id.au>
> > 
> > The NPCT75x TPM is TIS compatible. It has an I2C and SPI interface.
> > 
> > https://www.nuvoton.com/products/cloud-computing/security/trusted-platform-module-tpm/
> > 
> > Add a compatible string for it, and the generic compatible.
> > 
> > OpenBMC-Staging-Count: 3
> 
> Delete this from every patch that it appears from.
> 
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
> > Link: https://lore.kernel.org/r/20220928043957.2636877-4-joel@jms.id.au
> > Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> > ---
> >  drivers/char/tpm/tpm_tis_i2c.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/char/tpm/tpm_tis_i2c.c b/drivers/char/tpm/tpm_tis_i2c.c
> > index a897402cc36a..9511c0d50185 100644
> > --- a/drivers/char/tpm/tpm_tis_i2c.c
> > +++ b/drivers/char/tpm/tpm_tis_i2c.c
> > @@ -383,6 +383,8 @@ MODULE_DEVICE_TABLE(i2c, tpm_tis_i2c_id);
> >  #ifdef CONFIG_OF
> >  static const struct of_device_id of_tis_i2c_match[] = {
> >  	{ .compatible = "infineon,slb9673", },
> > +	{ .compatible = "nuvoton,npct75x", },
> > +	{ .compatible = "tcg,tpm-tis-i2c", },
> 
> What's the point of the generic compatible if you are adding the device
> specific ones to the driver anyway?
> 

$ git grep infineon,slb9673
Documentation/devicetree/bindings/trivial-devices.yaml:          - infineon,slb9673
drivers/char/tpm/tpm_tis_i2c.c: { .compatible = "infineon,slb9673", },
$ git grep nuvoton,npct75x
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts:            compatible = "nuvoton,npct75x", "tcg,tpm-tis-i2c";
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts:            compatible = "nuvoton,npct75x", "tcg,tpm-tis-i2c";
$ git grep tcg,tpm-tis-i2c
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts:            compatible = "nuvoton,npct75x", "tcg,tpm-tis-i2c";
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts:            compatible = "nuvoton,npct75x", "tcg,tpm-tis-i2c";
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts:             compatible = "tcg,tpm-tis-i2c";

It looks like at least the generic entry is needed, given that it is quite
likely that there is hardware out there using it. Other than that, this
makes me wonder: Is there some official guideline describing if and when
to use (only) generic devicetree compatible entries and when specific ones
may / should / have to be used ? I suspect the answer to your question might
simply be "because we did not know better", and it might be helpful to be
able to say "please see XXX for details".

Thanks,
Guenter
