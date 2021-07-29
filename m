Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A66F43DAD9F
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Jul 2021 22:31:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbMdK3hlHz3cGg
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Jul 2021 06:31:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.53; helo=mail-io1-f53.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbMdB0Ts4z2yXM
 for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Jul 2021 06:31:41 +1000 (AEST)
Received: by mail-io1-f53.google.com with SMTP id m13so8742937iol.7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 29 Jul 2021 13:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KUWvqLY5dtYTcBMoP6MzaeBbDWJ4C0b6SsAxNWS8lfo=;
 b=A8YyZTHs90a6xQrFlua4V+SGonNjnDON3yYg6KigeeLEk/m1mx5khpIHqX3dxLbCoI
 cgBTBgY94IgDhhSy8pCcffUr7reZml2Zlfw98pVE8M9V8Tc1tCoja+rSrPXLza5ObSyg
 lGY/cvnec0vfDaamvkAl+3mixw/L5QqjW+SrsaXOhWTXYMn3wULlP1bJ+bUWtZgabacV
 33kZMSiGDNWciGmttB6KVRh8LS6m4V0rJVbSQU3hSZzxnkLKmzXhcDnyGwp+tWD9M6pI
 l1Nc5+Wc0+M3uekeuXxmyaE2mmdrRh4Inj8SS1DzCaAqlVrCnK3W9oC/LpD3QSW98bYo
 6Qew==
X-Gm-Message-State: AOAM532qYA3KEb7x8R4axyXXs3uL9xz1tmPB0VkAi/FAtkV8hyLEkjWp
 URRGMmqg11Q1jO11yca0wg==
X-Google-Smtp-Source: ABdhPJwioEdi04/jbfnfuOGVu5hP7n0ehPaMIaPvCp13mUJRpi/eNyFwP4zVRi+5d9gf9aBvRLrKSQ==
X-Received: by 2002:a5d:8986:: with SMTP id m6mr5466807iol.87.1627590697396;
 Thu, 29 Jul 2021 13:31:37 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id a3sm2101033ilj.39.2021.07.29.13.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 13:31:36 -0700 (PDT)
Received: (nullmailer pid 835093 invoked by uid 1000);
 Thu, 29 Jul 2021 20:31:35 -0000
Date: Thu, 29 Jul 2021 14:31:35 -0600
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v2 1/8] dt-bindings: iio: adc: rename the aspeed adc yaml
Message-ID: <YQMQJ15KpM0eeLIb@robh.at.kernel.org>
References: <20210723081621.29477-1-billy_tsai@aspeedtech.com>
 <20210723081621.29477-2-billy_tsai@aspeedtech.com>
 <20210723154456.00006744@Huawei.com>
 <E650AFD8-FFD1-4D87-87B0-42D20D9C3BB4@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E650AFD8-FFD1-4D87-87B0-42D20D9C3BB4@aspeedtech.com>
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 BMC-SW <BMC-SW@aspeedtech.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "jic23@kernel.org" <jic23@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jul 26, 2021 at 06:53:07AM +0000, Billy Tsai wrote:
> Hi Jonathan,
> 
> On 2021/7/23, 10:45 PM, "Jonathan Cameron" <Jonathan.Cameron@Huawei.com> wrote:
> 
>     On Fri, 23 Jul 2021 16:16:14 +0800
>     Billy Tsai <billy_tsai@aspeedtech.com> wrote:
> 
>     >   > The aspeed,ast2400-adc.yaml not only descriptor the bindings of ast2400.
>     >   > Rename it to aspeed,adc.yaml for all of the aspeed adc bindings.
>     >   > 
>     >   > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> 
>     >   We try to avoid 'wild' card type namings most of the time and instead
>     >   name after a particular part number.  I say try because clearly
>     >   we let a few in over the years :(
> 
>     >   It is very hard to know if this binding will apply to 'all' future
>     >   aspeed ADCs.
> 
>     >   As such I'm not sure this particular rename makes sense.
> 
> If I want to extend the yaml file to compatible more versions of the aspeed adc.
> Would you suggest to add new files call aspeed,ast2600-adc.yaml or just append it
> to the aspeed,ast2400-adc.yaml?

If 2600 is not backwards compatible with 2400, then probably a new 
schema file. Given you are adding new properties (which only apply to 
2600?), then most likely a new schema file. Depends at which point there 
are too many conditional (if/then/else) schemas.

Rob
