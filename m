Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B02D4F9F98
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Nov 2019 01:51:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CQzN1s9CzF5xb
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Nov 2019 11:51:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U292mIpZ"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CQzF4TXDzF5xD
 for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Nov 2019 11:51:21 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id r24so97387otk.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 16:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=8BT6daCO7rWCmxUPquIuhlDA7Ogbr/3u1F/qsZuINIo=;
 b=U292mIpZOTOrebmfuZAF/2lMOkCrJRrkLdXZ1tmiH7m/mk2GlwbOq0vR64NgIvMTtQ
 ZQsuIFP1FTZIZf3eBk81/NYNy6u8k7Sp4is/qdMyizw2MRhgqQ5E3TmViDybX8gyGCfj
 6NFYl5zx3pxnDOXpIVtfdWDyA2MyTUp1vQkZJyaMXUyNPKKnuQI6KBavRXzjOzBiyRI3
 5EX4qzvXbhvai3oRJDDEqS80d84jsd3MmdH21h+7Jbi04sHfv2bfqHXJMcvOsFucYRTR
 MvY7BGgSn3jAeoEr8uIOlFVHCfD2MoOl59V6GWtWQ8h579SSUdM8bh18nXi4OKKymOAN
 q+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=8BT6daCO7rWCmxUPquIuhlDA7Ogbr/3u1F/qsZuINIo=;
 b=oTRmHLd/DKKvYGV1GEISGyNIRnqF/UEnhcgbttlgv6WOJijH0N+rtB5VeYUsAbd+nR
 DM3mE4Pd/x0meykZ4be5mj+XL1LmsKDkqRqGem1nNz/k1WSOHIbyA1MlWfNUzeBQMlRz
 /QGczrtOxZCZZSEMwJU4PmhmXDEaz7H1Xods3WKTTWHEbzJ7owiU5NlpceaaiiVIDRCn
 mLax3C0JzXv5b6zUgFyXRUrVjAh0FVd0j6wxmMxaq5YX2+y7BXligRUKdVvT6GWIeOUp
 qL4AQ0WGF4q27zhX+VVTY/vJphqgQGVsTi3uWw0b5Ro2KLnSiXiQeGkzHS4xyWDA0ZXh
 /baA==
X-Gm-Message-State: APjAAAVaWfb2VYDfoZj9Dci6Y7D52kpoZi+QsrP3KQyQhRBcRPQOfM/p
 cKrvHPrAu54aCvU5FQgyKA==
X-Google-Smtp-Source: APXvYqzHnt4GBogMEYRcGGdCUfNH4wDXRQjRowWJDj84lzygvhQMHEOPOtbJqUUjn/hVNd5VS/OmHQ==
X-Received: by 2002:a9d:12a3:: with SMTP id g32mr332590otg.61.1573606277516;
 Tue, 12 Nov 2019 16:51:17 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id q4sm177478otl.79.2019.11.12.16.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 16:51:17 -0800 (PST)
Received: from minyard.net (unknown [192.168.27.180])
 by serve.minyard.net (Postfix) with ESMTPSA id 947A618016D;
 Wed, 13 Nov 2019 00:51:16 +0000 (UTC)
Date: Tue, 12 Nov 2019 18:51:15 -0600
From: Corey Minyard <minyard@acm.org>
To: Asmaa Mnebhi <Asmaa@mellanox.com>
Subject: Re: [Openipmi-developer] [PATCH 2/2] drivers: ipmi: Modify max
 length of IPMB packet
Message-ID: <20191113005115.GK2882@minyard.net>
References: <20191112023610.3644314-1-vijaykhemka@fb.com>
 <20191112023610.3644314-2-vijaykhemka@fb.com>
 <20191112124845.GE2882@minyard.net>
 <7BC487D6-6ACA-46CE-A751-8367FEDEE647@fb.com>
 <20191112202932.GJ2882@minyard.net>
 <DB6PR0501MB27127CF534336BDEB5D005FFDA770@DB6PR0501MB2712.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB6PR0501MB27127CF534336BDEB5D005FFDA770@DB6PR0501MB2712.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: minyard@acm.org
Cc: "cminyard@mvista.com" <cminyard@mvista.com>, Sai Dasari <sdasari@fb.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Nov 12, 2019 at 10:06:00PM +0000, Asmaa Mnebhi wrote:
> Also, let me clarify one thing. It doesn't matter how big the response is. In my testing, I also had some responses that are over 128 bytes, and this driver still works. It is the user space program which determines the last bytes received. The 128 bytes is the max number of bytes handled by your i2c/smbus driver at each i2c transaction. My i2c driver can only transmit 128 bytes at a time. So just like Corey pointed out, it would be better to pass this through ACPI/device tree.

Yeah, I would really prefer device tree.  That's what it's designed for,
really.  ioctls are not really what you want for this.  sysfs is a
better choice as a backup for device tree (so you can change it if it's
wrong).

-corey

> 
> -----Original Message-----
> From: Corey Minyard <tcminyard@gmail.com> On Behalf Of Corey Minyard
> Sent: Tuesday, November 12, 2019 3:30 PM
> To: Vijay Khemka <vijaykhemka@fb.com>
> Cc: Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; openipmi-developer@lists.sourceforge.net; linux-kernel@vger.kernel.org; cminyard@mvista.com; Asmaa Mnebhi <Asmaa@mellanox.com>; joel@jms.id.au; linux-aspeed@lists.ozlabs.org; Sai Dasari <sdasari@fb.com>
> Subject: Re: [PATCH 2/2] drivers: ipmi: Modify max length of IPMB packet
> 
> On Tue, Nov 12, 2019 at 07:56:34PM +0000, Vijay Khemka wrote:
> > 
> > 
> > ﻿On 11/12/19, 4:48 AM, "Corey Minyard" <tcminyard@gmail.com on behalf of minyard@acm.org> wrote:
> > 
> >     On Mon, Nov 11, 2019 at 06:36:10PM -0800, Vijay Khemka wrote:
> >     > As per IPMB specification, maximum packet size supported is 255,
> >     > modified Max length to 240 from 128 to accommodate more data.
> >     
> >     I couldn't find this in the IPMB specification.
> >     
> >     IIRC, the maximum on I2C is 32 byts, and table 6-9 in the IPMI spec,
> >     under "IPMB Output" states: The IPMB standard message length is
> >     specified as 32 bytes, maximum, including slave address.
> > 
> > We are using IPMI OEM messages and our response size is around 150 
> > bytes For some of responses. That's why I had set it to 240 bytes.
> 
> Hmm.  Well, that is a pretty significant violation of the spec, but there's nothing hard in the protocol that prohibits it, I guess.
> 
> If Asmaa is ok with this, I'm ok with it, too.
> 
> -corey
> 
> >     
> >     I'm not sure where 128 came from, but maybe it should be reduced to 31.
> >     
> >     -corey
> >     
> >     > 
> >     > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> >     > ---
> >     >  drivers/char/ipmi/ipmb_dev_int.c | 2 +-
> >     >  1 file changed, 1 insertion(+), 1 deletion(-)
> >     > 
> >     > diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> >     > index 2419b9a928b2..7f9198bbce96 100644
> >     > --- a/drivers/char/ipmi/ipmb_dev_int.c
> >     > +++ b/drivers/char/ipmi/ipmb_dev_int.c
> >     > @@ -19,7 +19,7 @@
> >     >  #include <linux/spinlock.h>
> >     >  #include <linux/wait.h>
> >     >  
> >     > -#define MAX_MSG_LEN		128
> >     > +#define MAX_MSG_LEN		240
> >     >  #define IPMB_REQUEST_LEN_MIN	7
> >     >  #define NETFN_RSP_BIT_MASK	0x4
> >     >  #define REQUEST_QUEUE_MAX_LEN	256
> >     > -- 
> >     > 2.17.1
> >     >
> >     
> > 
> 
> _______________________________________________
> Openipmi-developer mailing list
> Openipmi-developer@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/openipmi-developer
