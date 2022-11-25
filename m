Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5646D6382F1
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Nov 2022 05:00:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJLjs6VjVz3dwd
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Nov 2022 15:00:17 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=jammy_huang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJLjp4jhGz3c8V;
	Fri, 25 Nov 2022 15:00:12 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 2AP3Yqrq036587;
	Fri, 25 Nov 2022 11:34:52 +0800 (GMT-8)
	(envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Nov
 2022 11:59:21 +0800
Message-ID: <0d58e557-3ed9-669a-febb-b4ac714af01e@aspeedtech.com>
Date: Fri, 25 Nov 2022 11:59:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] media: aspeed: Use v4l2_dbg to replace v4l2_warn to avoid
 log spam
Content-Language: en-US
To: Zev Weiss <zweiss@equinix.com>
References: <20221110095611.522-1-jammy_huang@aspeedtech.com>
 <20221122231216.GF18848@packtop>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <20221122231216.GF18848@packtop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2AP3Yqrq036587
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "zev@bewilderbeest.net" <zev@bewilderbeest.net>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Zev,

On 2022/11/23 上午 07:12, Zev Weiss wrote:
> On Thu, Nov 10, 2022 at 01:56:11AM PST, Jammy Huang wrote:
>> If the host is powered off, there will be many warning log. To avoid the
>> log spam in this condition, replace v4l2_warn with v4l2_dbg.
>>
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>> drivers/media/platform/aspeed/aspeed-video.c | 16 ++++++++--------
>> 1 file changed, 8 insertions(+), 8 deletions(-)
>>
> Thanks Jammy -- after dropping the one hunk that wasn't applicable (due
> to not having all the prerequisite patches) this definitely fixed the
> log noise problems I'd been having.
>
> I'm assuming the prerequisite patches are from your aspeed-jpeg support
> patch series?  If so, since this is a smaller/simpler patch, I think it
> might make sense to reorder things to try to get this merged first and
> then fixing up that patchset to use v4l2_dbg() instead of v4l2_warn(),
> rather than introducing a new instance of it and then patching it back
> out later with this one.

Yes, the prerequisite patches are 'aspeed-jpeg support' patch series. 
And that patch series

has been accepted and pull for v6.2. Your suggestion is better to 
decouple these patches.

I would pay attention to the problem like this to avoid this condition 
in the future.

Many thanks for your kindly help.

>
>
> Thanks,
> Zev

-- 
Best Regards
Jammy

