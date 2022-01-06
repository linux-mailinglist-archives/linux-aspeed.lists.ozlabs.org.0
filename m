Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7506448686D
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jan 2022 18:25:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVCtC2HmMz30KZ
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 Jan 2022 04:25:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ShaVbv1m;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ShaVbv1m; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVCt22wxNz2yfh;
 Fri,  7 Jan 2022 04:25:28 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id r131so4681224oig.1;
 Thu, 06 Jan 2022 09:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TozlrHGra5XodYQFqCtDs+94E5DctxLnj7llPHao5XY=;
 b=ShaVbv1mLd0t/CMtcyvNeH+MVOScPrT2gNMh1L9O+mbMwJJEzoCnU5bOVvLFTFbx29
 CIW3P5q5QyTpy6pyT4EBsYGYXOSQLWhxqlXSWfnWtyEM+kiCOhVqB0YrvaAr2Pk9qUfa
 VgIycswwxuc31jd4f9ZqkD2jM3fV2euzyj67EIHLT7Ll2jMm9UUjf1fkvMygD61A+3Ic
 t45RWPwOVlul4HkRHH39SgCXbeZoXSxQa0AQHbwXUAVYIAbixIN8mkdNtQK1Q99yR8Sh
 xuQXgPXx9dG3G2WLjltBRGzGRstCVw7RH6mR7QyEn/GVsqzMACOU0P65oBDvCJ0+V0EC
 H+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TozlrHGra5XodYQFqCtDs+94E5DctxLnj7llPHao5XY=;
 b=qW0xPTOl+9xv61ucjX2/1JlrI5ep6XasXTeO+7by6s1M5nQe3AgXT4IVPFMNWI6tV5
 NJe4W7KXJE9LnQAPj5629vVjlmyIRW6qxqcq/Hoo4jVgxTU+K0XBSF6h2+ue45AIXaYF
 AIrwEyNM2eN1P9BPz34aF0Rj73eF9SfI61NmsvhyeE4ZkZzutLvob4JH6LCSPAtWslNK
 gtFG4/da+VaWdy/y7TXr/UZsdl5rqYwGm3HdivMiLfmTTc0jygD75r5geNAPPqQgaj+w
 WaxqgPpDv6mRKhUAwnp2R6xDmpxaxO5MgN6vcP4JyULyp9oTELV2cjgFLE6RVrSsVDTz
 fY7w==
X-Gm-Message-State: AOAM533MiXSRLyN2abE4dh4Z4488w2XCv/o9/wk/+mnVnBzvIjDrEgv4
 zfef7dUHqTIRfFsd/+0LdF4=
X-Google-Smtp-Source: ABdhPJwaVLxSFBfd3Dmpfs7ev1L4qtYx6bsFTZlvyEcxN0rHUzXDQWgkZ5ORNW5g6GbEH+1WZr5Ezw==
X-Received: by 2002:aca:ad57:: with SMTP id w84mr6597267oie.69.1641489925201; 
 Thu, 06 Jan 2022 09:25:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 bi20sm513287oib.29.2022.01.06.09.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 09:25:24 -0800 (PST)
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <2cafa0607ca171ebd00ac6c7e073b46808e24f00.1640537669.git.christophe.jaillet@wanadoo.fr>
 <YcldM9sgYdjMYMtH@kroah.com> <20220106081418.GH7674@kadam>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] fsi: Aspeed: Fix a potential double free
Message-ID: <f2ba50fd-5c6b-e905-17ed-541dcc98c6c1@roeck-us.net>
Date: Thu, 6 Jan 2022 09:25:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220106081418.GH7674@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed@lists.ozlabs.org, alistair@popple.id.au,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-arm-kernel@lists.infradead.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 1/6/22 12:14 AM, Dan Carpenter wrote:
> On Mon, Dec 27, 2021 at 07:29:07AM +0100, Greg KH wrote:
>> On Sun, Dec 26, 2021 at 05:56:02PM +0100, Christophe JAILLET wrote:
>>> 'aspeed' is a devm_alloc'ed, so there is no need to free it explicitly or
>>> there will be a double free().
>>
>> A struct device can never be devm_alloced for obvious reasons.  Perhaps
>> that is the real problem here?
>>
> 
> I don't understand how "aspeed" is a struct device.
> 

-static void aspeed_master_release(struct device *dev)
-{
-	struct fsi_master_aspeed *aspeed =
-		to_fsi_master_aspeed(dev_to_fsi_master(dev));
-
-	kfree(aspeed);
-}

So "dev" is embedded in struct fsi_master, and struct fsi_master is embedded
in struct fsi_master_aspeed. Since "struct device" is embedded, the data
structure embedding it must be released with the release function, as is done
here. The problem is indeed that the data structure is allocated with
devm_kzalloc(), which as Greg points out must not be devm_ allocated
(because its lifetime does not match the lifetime of devm_ allocated
memory).

> I've been working on understanding device managed memory recently for
> Smatch.  It's really complicated.  There are a bunch of rules/heuristics
> that I'm slowly creating to generate new warnings but I'm a long way
> from understanding it well myself.
> 

A data structure embedding struct device must not be devm_ allocated,
and it must be released with the release callback. Maybe there is
a means to flag that somehow ?

Guenter
