Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B48F9AB1
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 21:29:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CK9T4tWdzF43N
	for <lists+linux-aspeed@lfdr.de>; Wed, 13 Nov 2019 07:29:49 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="c5yUTYdu"; 
 dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CK9K38hkzF3yY
 for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Nov 2019 07:29:39 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id y194so16103960oie.4
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 12:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=nuSxtpboCRFRoH7ONR/ButKqpEu2VWZcgPYrZ3xx478=;
 b=c5yUTYduIUiho00H0b3vhjtRjB+ajbeo7u2wmpJPSMI0+GG55FNytcQPRmRnWnyFj1
 m432tYV8/llpTRhPJfog/sSGDxnrAMUqkwR9Zqq+MNfLAtXO56t75b8042lQmynQEPUQ
 P66WVNVMDWdc5oalPToJYo0bl83h34bPblu7b9DkYCExgOHck3JuCFrqAIJm5P/otTux
 Uus+Bili5xOtFHdymFj7uqdzv/GtqofxZY5yfPdUTg/eg8NRGUZD9t5M+O/2ST7Pfqiy
 Wd6X4pUb8PBIxJoVziUV1cNNzAp49YvHBtA/neT73vXlgc9I9FOL2Znm/AbvtWgo0S+K
 jScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=nuSxtpboCRFRoH7ONR/ButKqpEu2VWZcgPYrZ3xx478=;
 b=lkvl6G4eAYOK00Gtchbg4sQg5dYn7a+6mgXLjPY9je5uvUqqXD1L9yTBVH4DLAYRx0
 EgoNf0HW6mD0PO3NS68wBV2N8UV1dvroaWzzqlqXi8ezicurHAOLKNuVD67CVIqRSc7a
 6CSm8TN32a5CqjxOJE2VLZdN3PL8IzJ/zJTaLNvZd5+nlSvgW/+5EtJcP4xggQsji86Q
 WJ92dNFwta94orn0H9c6G1CGASEIrryPf8L//nwToHsaf/WW+QmJdgUjcCvXp58dNRZf
 QWT53srrrCHWaVgbxjnjXpFHEsnn/m/T4Q7r1HKervvYseXE0P4lMaMzo7wJssgRiskr
 bIbw==
X-Gm-Message-State: APjAAAXpgC6NIKwypTecKBUzZM9y5HXkN+TE/ZLgVupjI1FpX65Im48r
 Mn2FaxgI9XKIYmUHCfScYQ==
X-Google-Smtp-Source: APXvYqzkAt+1k/8BZCXeyArXDOhGImLjCdeMesIH8HcGa0Km475jeAHh7ADW67WFyJhYu8RqDGgvZQ==
X-Received: by 2002:a05:6808:181:: with SMTP id
 w1mr751465oic.109.1573590575994; 
 Tue, 12 Nov 2019 12:29:35 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id k6sm2775908otr.35.2019.11.12.12.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 12:29:35 -0800 (PST)
Received: from minyard.net (unknown [192.168.27.180])
 by serve.minyard.net (Postfix) with ESMTPSA id 4A03118016D;
 Tue, 12 Nov 2019 20:29:33 +0000 (UTC)
Date: Tue, 12 Nov 2019 14:29:32 -0600
From: Corey Minyard <minyard@acm.org>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH 2/2] drivers: ipmi: Modify max length of IPMB packet
Message-ID: <20191112202932.GJ2882@minyard.net>
References: <20191112023610.3644314-1-vijaykhemka@fb.com>
 <20191112023610.3644314-2-vijaykhemka@fb.com>
 <20191112124845.GE2882@minyard.net>
 <7BC487D6-6ACA-46CE-A751-8367FEDEE647@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7BC487D6-6ACA-46CE-A751-8367FEDEE647@fb.com>
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

On Tue, Nov 12, 2019 at 07:56:34PM +0000, Vijay Khemka wrote:
> 
> 
> ﻿On 11/12/19, 4:48 AM, "Corey Minyard" <tcminyard@gmail.com on behalf of minyard@acm.org> wrote:
> 
>     On Mon, Nov 11, 2019 at 06:36:10PM -0800, Vijay Khemka wrote:
>     > As per IPMB specification, maximum packet size supported is 255,
>     > modified Max length to 240 from 128 to accommodate more data.
>     
>     I couldn't find this in the IPMB specification.
>     
>     IIRC, the maximum on I2C is 32 byts, and table 6-9 in the IPMI spec,
>     under "IPMB Output" states: The IPMB standard message length is
>     specified as 32 bytes, maximum, including slave address.
> 
> We are using IPMI OEM messages and our response size is around 150 bytes
> For some of responses. That's why I had set it to 240 bytes.

Hmm.  Well, that is a pretty significant violation of the spec, but
there's nothing hard in the protocol that prohibits it, I guess.

If Asmaa is ok with this, I'm ok with it, too.

-corey

>     
>     I'm not sure where 128 came from, but maybe it should be reduced to 31.
>     
>     -corey
>     
>     > 
>     > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
>     > ---
>     >  drivers/char/ipmi/ipmb_dev_int.c | 2 +-
>     >  1 file changed, 1 insertion(+), 1 deletion(-)
>     > 
>     > diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
>     > index 2419b9a928b2..7f9198bbce96 100644
>     > --- a/drivers/char/ipmi/ipmb_dev_int.c
>     > +++ b/drivers/char/ipmi/ipmb_dev_int.c
>     > @@ -19,7 +19,7 @@
>     >  #include <linux/spinlock.h>
>     >  #include <linux/wait.h>
>     >  
>     > -#define MAX_MSG_LEN		128
>     > +#define MAX_MSG_LEN		240
>     >  #define IPMB_REQUEST_LEN_MIN	7
>     >  #define NETFN_RSP_BIT_MASK	0x4
>     >  #define REQUEST_QUEUE_MAX_LEN	256
>     > -- 
>     > 2.17.1
>     > 
>     
> 
