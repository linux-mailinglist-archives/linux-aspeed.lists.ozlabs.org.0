Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF3F8118DE
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Dec 2023 17:14:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr0sm3gsSz3cCn
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Dec 2023 03:14:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.170; helo=mail-oi1-f170.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr0sZ5GY8z2yQL
	for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Dec 2023 03:13:53 +1100 (AEDT)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3b9f8c9307dso4043284b6e.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Dec 2023 08:13:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702484030; x=1703088830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKFwCtE90EPD9y2XJTF44lWNSwXrZ/Ik0w5o/94t9wo=;
        b=i6LKsEnHmLSui5jEAlVbzZiB/iojBAts2444eGaWVyyFMMu8ELG3m4w+T7V1AjZ446
         BPqZ6HSqOUoKSrqZ6mFXOmnZISf25pTicSDuzM7DZZxA8Ep3GOGsWvsIvEnnlok3+3ya
         4kman3nxekq5NwMtXTs1bpEOrGcfTrxtEGociiioBUkhaRiM2K+ZXFcrotNqOay4J1Ee
         0bPkGR804JWJj239yRI0s4Bf6lSKq9+F6dPHRxg8IzPuHDvBGazpQxJQIwyxpd5Dt6G0
         izr1COqKrd6kQdw43Wzla5cD8q9L7CZJYTq3CibnlIC5y29cTcRL0eZZ9aYBldpFmRQb
         n29A==
X-Gm-Message-State: AOJu0YyCYtVkrIKsf1d5AN7HsHH/3Wi+6Z+gxSyrZoYux0z6vF2FYpGc
	CYpbchlp01MQ2V1Tzp3ZaQ==
X-Google-Smtp-Source: AGHT+IHvwtas0Wz/5QoHKT/kRL+DgeC/VW8MvnUtSILOIvJ0GIakLipYqdQA3Ql3Vum+yJU0aDi0bQ==
X-Received: by 2002:a05:6871:6b90:b0:1fa:ff63:2d3b with SMTP id zh16-20020a0568716b9000b001faff632d3bmr7032507oab.44.1702484029822;
        Wed, 13 Dec 2023 08:13:49 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id zl10-20020a0568716d8a00b001fb42001fa7sm3978002oab.36.2023.12.13.08.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 08:13:49 -0800 (PST)
Received: (nullmailer pid 1207750 invoked by uid 1000);
	Wed, 13 Dec 2023 16:13:47 -0000
Date: Wed, 13 Dec 2023 10:13:47 -0600
From: Rob Herring <robh@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Subject: Re: [PATCH v1 2/8] dt-bindings: tpm: Add schema for TIS I2C devices
Message-ID: <20231213161347.GA1204384-robh@kernel.org>
References: <20231212164004.1683589-1-ninad@linux.ibm.com>
 <20231212164004.1683589-3-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212164004.1683589-3-ninad@linux.ibm.com>
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
Cc: festevam@denx.de, linux-aspeed@lists.ozlabs.org, alexander.stein@ew.tq-group.com, naresh.solanki@9elements.com, johannes.holland@infineon.com, linux-hardening@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, peterhuewe@gmx.de, patrick.rudolph@9elements.com, peteryin.openbmc@gmail.com, jgg@ziepe.ca, andrew@codeconstruct.com.au, linux@roeck-us.net, devicetree@vger.kernel.org, conor+dt@kernel.org, keescook@chromium.org, broonie@kernel.org, lakshmiy@us.ibm.com, bhelgaas@google.com, geissonator@yahoo.com, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, linux-kernel@vger.kernel.org, gpiccoli@igalia.com, jarkko@kernel.org, vincent@vtremblay.dev, linux-integrity@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Dec 12, 2023 at 10:39:58AM -0600, Ninad Palsule wrote:
> From: Johannes Holland <johannes.holland@infineon.com>
> 
> Add a dt schema to support device tree bindings for the generic I2C
> physical layer. Refer to the TCG PC Client Platform TPM Profile (PTP)
> Specification for TPM 2.0 v1.04 Revision 14.
> 
> This includes descriptions for the Nuvoton and Infineon devices.

This is incomplete and conflicts with this series[1]. Please help 
review and make sure it works for the cases you care about.

Rob

[1] https://lore.kernel.org/all/cover.1701093036.git.lukas@wunner.de/
