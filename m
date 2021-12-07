Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B0D46C69C
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Dec 2021 22:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7tVb6XQdz2ypZ
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Dec 2021 08:20:07 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.42; helo=mail-oo1-f42.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7tVV4sFWz2xB0
 for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Dec 2021 08:20:01 +1100 (AEDT)
Received: by mail-oo1-f42.google.com with SMTP id
 w5-20020a4a2745000000b002c2649b8d5fso144144oow.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Dec 2021 13:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TDybkYmRgN7ASFL9lU803KLgt8MDRIp7lKanWAFVy8w=;
 b=jEZIP0sVgrNqvvH2l9eJTG4taXH/t92+Xu1cPU9YO62XxEih+Ax3FJg6wlISFZ73/X
 LHB5pIQO1excF+giFX6oASKXcdY8pBRxUbLyuTjcJP7r8oB4LHVlAcJd7cgEyx2qzP0i
 Qr68xqjdyrTBuZYtQL9FktqN2RurMIYwiMSl0e8yxq8syYJazYjku794thepbbkMcM1A
 KZBJUX95Y4m/Ow20divkE6OenUsm7TuSyQnMoDUvHUJ1hfjc8u6XS5P0C1KwQyyFRAmL
 8EnNgK6rxNfJ7TK2bb8SK5Y2Tva6KyV7BDONjPRcPyoinG1ag4f8rjOQKyCPLpA8aka6
 7U5A==
X-Gm-Message-State: AOAM530n2yQ1C9RQeXqgAErumL/zcfZCR7ubqtaTIzkt1BzNvZu+bfX2
 W1OzB8qVsXFrNppzLMrWMA==
X-Google-Smtp-Source: ABdhPJzQx6ifBIeo7YNw/4J7ZMf9KeE80PBI87o4MLSSxGDKBHAC15DEydOg8wZjHXu+Y1USi6AwDQ==
X-Received: by 2002:a4a:b00e:: with SMTP id f14mr27855125oon.10.1638911997778; 
 Tue, 07 Dec 2021 13:19:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o2sm214597oik.11.2021.12.07.13.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 13:19:56 -0800 (PST)
Received: (nullmailer pid 850716 invoked by uid 1000);
 Tue, 07 Dec 2021 21:19:55 -0000
Date: Tue, 7 Dec 2021 15:19:55 -0600
From: Rob Herring <robh@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [v14 0/2] Support pwm driver for aspeed ast26xx
Message-ID: <Ya/P+4CNTnUUqlG9@robh.at.kernel.org>
References: <20211130055933.32708-1-billy_tsai@aspeedtech.com>
 <CACPK8XfM4C7v3keXaxMs9SkqNzb8XWbZ6QvcZXWcy3ZKJCrvWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XfM4C7v3keXaxMs9SkqNzb8XWbZ6QvcZXWcy3ZKJCrvWQ@mail.gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-pwm@vger.kernel.org, BMC-SW <BMC-SW@aspeedtech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Dec 07, 2021 at 06:45:47AM +0000, Joel Stanley wrote:
> Hi Billy,
> 
> On Tue, 30 Nov 2021 at 05:58, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
> >
> > The legacy driver of aspeed pwm is binding with tach controller and it
> > doesn't follow the pwm framworks usage. In addition, the pwm register
> > usage of the 6th generation of ast26xx has drastic change. So these
> > patch serials add the new aspeed pwm driver to fix up the problem above.
> 
> Sorry for not taking a look earlier. Well done on making it this far.
> 
> There's a few things that need to be addressed before merging this.
> 
> Firstly, the bindings need fixing up. I think these should be the one
> file. The device tree bindings are supposed to describe the hardware,
> and it doesn't make sense to separate them out just because we plan on
> using two subsystems to implement the functionality.
> 
> Rob, please chime in if you would prefer something different.

I prefer to see a common binding for fans which I said multiple times 
on this series. As the same thing keeps getting posted, I've stopped 
looking at this one.

Rob
