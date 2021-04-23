Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BCC36BCD7
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Apr 2021 03:05:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTk8X3QbVz304V
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Apr 2021 11:05:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dPWtMidH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=sorganov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dPWtMidH; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRWCx6QbRz2xZS
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Apr 2021 20:45:47 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id g8so76895408lfv.12
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Apr 2021 03:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=TgFjxtYsOVaP6v4PMZp8irtY/yFk5woDCqAeiCFqABA=;
 b=dPWtMidHtJu/eQ7X+GMrm8eY6cIAu28zOaBEA0d3WhtJ630XTxz/F1si9qzLMJHyG/
 hWZjePMhtoigzpcf55ecqAtJmDbEQUIGFZm4CZYbpRJvR6ehddDWWL9cvB7Y2osTZyVs
 1d3GIe/jyMetbl3liuB/IDuGoHaaM1ncGwjQEED08omLCh0S9wA785smoM5hmFfON8jq
 kM/Dhaqq5HJFosb4yvo4F7pOAtlz8ZwEjW94C5a2IYyOAdoB9N8jprhABxW8X2mVl2lg
 HJc0/A5nX1i+7MWdHiPNth6Nohuk1csOl/wAD1XaqIPxaLYpp7m+aKemnGq+Mdruix67
 rGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version;
 bh=TgFjxtYsOVaP6v4PMZp8irtY/yFk5woDCqAeiCFqABA=;
 b=PNGZzCia8dS1QTTKmbiCQyH1UHJyfTaW2CiCIxJMG5kRCbbwGjfUtMKVQAAHa9oLAv
 Y4EIgdrlTMvjqtTfl/32uHDWOiGypi4VveuT8Qh8ESX+Cab/v4Kdp2P/t54OAJ/FOXiK
 S/LktXJq7Yta1UAlahWSG8AI93H7+hcBgKoEaRboJSiZwRoocVoOSIYiFLe6cFATYJGz
 4S4co5o+ZiS/YAcu/39XJhzN38BgXaUu7x/+p184G5Ez+zNYurSzgxSFTTPP2G/iKaZK
 V1ZVRHbvBfl2isWBSm1mOFpLDM2f3lYfkJG/ThNKDtAghMmDjNZpNXnG9cjNyzpfWc9N
 ZD1w==
X-Gm-Message-State: AOAM533rhtOMOL3vg8IfiJ1gU5PyJZl+idWpm8/ocq6kAy2askgRwcM5
 H8JlEupqaPeu7P5n1urdJJQ=
X-Google-Smtp-Source: ABdhPJx4pt/zKtSwBTkr28o85OGy0iMHjelM1jfbr/K3643b8l/4aWyywGt6IMkkyHH0FRidibW/TQ==
X-Received: by 2002:ac2:5682:: with SMTP id 2mr2287134lfr.524.1619174742625;
 Fri, 23 Apr 2021 03:45:42 -0700 (PDT)
Received: from osv.localdomain ([89.175.180.246])
 by smtp.gmail.com with ESMTPSA id y8sm514938lfe.259.2021.04.23.03.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 03:45:41 -0700 (PDT)
From: Sergey Organov <sorganov@gmail.com>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH] soc: aspeed: fix a ternary sign expansion bug
References: <YIE90PSXsMTa2Y8n@mwanda>
 <59596244622c4a15ac8cc0747332d0be@AcuMS.aculab.com>
Date: Fri, 23 Apr 2021 13:45:40 +0300
In-Reply-To: <59596244622c4a15ac8cc0747332d0be@AcuMS.aculab.com> (David
 Laight's message of "Thu, 22 Apr 2021 16:21:40 +0000")
Message-ID: <877dktuvmz.fsf@osv.gnss.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 27 Apr 2021 11:05:09 +1000
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
Cc: Robert Lippert <rlippert@google.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 'Dan Carpenter' <dan.carpenter@oracle.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

David Laight <David.Laight@ACULAB.COM> writes:

> From: Dan Carpenter
>> Sent: 22 April 2021 10:12
>> 
>> The intent here was to return negative error codes but it actually
>> returns positive values.  The problem is that type promotion with
>> ternary operations is quite complicated.
>> 
>> "ret" is an int.  "copied" is a u32.  And the snoop_file_read() function
>> returns long.  What happens is that "ret" is cast to u32 and becomes
>> positive then it's cast to long and it's still positive.
>> 
>> Fix this by removing the ternary so that "ret" is type promoted directly
>> to long.
>> 
>> Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
>> index 210455efb321..eceeaf8dfbeb 100644
>> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
>> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
>> @@ -94,8 +94,10 @@ static ssize_t snoop_file_read(struct file *file, char __user *buffer,
>>  			return -EINTR;
>>  	}
>>  	ret = kfifo_to_user(&chan->fifo, buffer, count, &copied);
>> +	if (ret)
>> +		return ret;
>> 
>> -	return ret ? ret : copied;
>> +	return copied;
>
> I wonder if changing it to:
> 	return ret ? ret + 0L : copied;
>
> Might make people think in the future and not convert it back
> as an 'optimisation'.

It rather made me think: "what the heck is going on here?!"

Shouldn't it better be:

 	return ret ? ret : (long)copied;

or even:

        return ret ?: (long)copied;

?

-- Sergey Organov
