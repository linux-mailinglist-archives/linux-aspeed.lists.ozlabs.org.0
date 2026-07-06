Return-Path: <linux-aspeed+bounces-4403-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qm99I9qYS2oHWQEAu9opvQ
	(envelope-from <linux-aspeed+bounces-4403-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 06 Jul 2026 14:00:26 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC049710324
	for <lists+linux-aspeed@lfdr.de>; Mon, 06 Jul 2026 14:00:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BtuYZphI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZRR95HPO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4403-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4403-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gv2x34vMzz3bby;
	Mon, 06 Jul 2026 22:00:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783313763;
	cv=none; b=AS/whMquzqdueLBheJMi0xkBmBzri1VqBrmtjZZ5EE8kaePYzNF7CK02g7gJxkMMsF0DggYVUy4VeR2iUOnoFyf/7qmLEvg2uXel3jY8iF4OepLU2H9ei1vtQJKiPznCLD6B27ysWm+WnXURYQ3Xb5qQ8g9oyQGsXeeIJPmYnSld32RcKu7fqX24nQ0hSu6rRszK5Smuy1CU3AQwC4Y/d6WhxljtG3VnlznILsbErjZCkSCcy8Tv2bQAj8uynrCF13G3/3K6045ptTBKc+GWStGP8DdEcf+OqEhVnz8SXotlXvNNusJDutZiBFeevCBhjnhNglUt4fx+ZRzz3tIO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783313763; c=relaxed/relaxed;
	bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DT9VMTcWcMLlcRfuONzGKhr3ch3tjScVTHxCV61Hn4678rHXSkMOk5aCaqsqTkA+fjy4fVF/Ayvkaob3JG0ydJutMcnwRIeQXD/u0+XzwHBgEicbV0IJAbca+sedZma8NZQgI5CgDL0QFDdzR2N1sbCIRO/AVCi91EYmMMkyOLQQJEfkq0DE1XVUCpf2zBv9Kkp1f3Ly+B7E6GOakkZ7IB1WLpwd8uRn5LVoWs5KugrNRyaWcBV9hZYbkF1e0RcUH4NZg0lDe+eFp4l+0arRT3B/ieluuuGCib/I4MrRi2QQlNEmWCcFkVlC6C/GOntHOXVK9Vf5O8CmuoaX051vFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BtuYZphI; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZRR95HPO; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=ekansh.gupta@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gtsWP3M9kz2yVZ
	for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Jul 2026 14:55:59 +1000 (AEST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641mEr3402656
	for <linux-aspeed@lists.ozlabs.org>; Mon, 6 Jul 2026 04:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=; b=BtuYZphIK7UnAPPa
	qYGHPuM+VD3C6WvezTLdqIjiYVGHLzNLv6RSapQqEJ2excDEyUkD/0AEcWQjp5ej
	4HI3bMiV8UCRYHw/YXMP72BUtTB2CANb5/xl2wJKaV5lc87Ax6wEFDsEhbUsTXur
	RNx2Hm91I1sPL4Fp17l4JFxQuB37ZPnouzzUHhLqbWpMJkm6xOuGNEQuSB8vkr4v
	iHs+mInjL3lcrCXDe3aaUW3MnfspbyT4APEA3ecMXRsbeK03HAVvm7fbyNR3ckpu
	4lDTqZIfECL8APV6bvyHqU87nPrqklBdw7zS2B0zT/os5ltI50S9QbhC5yDZwUWY
	z7D7UA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgm8jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-aspeed@lists.ozlabs.org>; Mon, 06 Jul 2026 04:55:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811ae55313so2040863a91.3
        for <linux-aspeed@lists.ozlabs.org>; Sun, 05 Jul 2026 21:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783313756; x=1783918556; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=ZRR95HPOUicq5WtvsVTmO/5abHVAgcstF56SS3ap4bh0fUM8+hX3B070dISgQQGgtm
         CY8lxuoctm8vxqLD3pL0e9isdDzW9kIQAlDpPsPeyHy/WGWO94yV/jBF44tPG1e3dGcH
         Jwp+oqCeBgCLJj0u/Swfg/ZBWCI8Jgxs502sSbFPVYrgK8SXke5++Q1/Q+AimW+e6mGM
         y3rnHbHGAJjI9wrSZAE44YgqBeCltOVPtQ/kxCYLCCLDXTksXqJImhJenfbLDlfBVCgL
         +02n7ncs4xdQry0o1980GKYPM+rDSbgw1UvljA76W5Scd0SH5O/y925t8KZIgsrlh3jD
         b3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783313756; x=1783918556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=iZ67Z0Qxp2fVChwtv8yRmndPUS1hMuG3YTrvBeeM0/ZFI4hd6lO4+FSbjA1RPeBTUE
         nV63000rQQWzMRY+kHixZTVWUUWzuNGDY4aI7GZyZ5uWGJWk33dIyrFkNZTOaOUUf3R9
         gUbGzk08jakinlp4xcQ+4+nAu32ybGsyHEW2fIH5C68TBrWU86aAQKA1s8JXftalzcSu
         G65Yq/bQF1H0OvGFFI4F1T5Gx4Ff4TVhyHlYspIixFRcpSczZo18B9+d4zmmAHT995AE
         /C5GnCs6hlpYr3CFDtvAlevjO6HJ/hhqu8lV8BPVDa01UFUcNsJQtD3Z5+gIv5X/S6zz
         3HfQ==
X-Forwarded-Encrypted: i=1; AHgh+RpaqR00jM+vq9L5UNh3Nu4j2/FcZVR3xtlJuCg8RTBo4ybUn4IhDqmunxS6gVve7xisX6D7QW+x/5PzUwI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxE2OTB1HKVJjQkALsmPq00IKoCftle+KL7IGavQp+hxvXTjF1p
	zmEcOHN37EGSCSbCECXy8Nxkuzgi7XokPJpHLjaPxhiKzAe/Fravyc+XyCcVhDmdXHtfpVSKlMd
	ZS+SvjsQAs017b4SH25k6+DFSEGVfs9eoL0YoQDVOeGjj2dscNxK5vSLNb5rJ7YjjUkcn
X-Gm-Gg: AfdE7cm5PPuJjTVjdbCXc5EEBsXnXNtrxCjzb4z1tQWSVUuc2DqpN11tREjLwMiwe4E
	Jc4tjEkxO7EqXNklGyokgl+BjPt0NiKEoXP/fy1Nykfhw+2WaACkbnA4+T0jES/YmeGoB62b4u9
	nxfD788P8alre08RDvINfTI7mSw6HImNs1E9E2R72Nm8/ZKqltwZaYtmVkf+oQs+WSk6YS0piCK
	9XFYGwI/tQLl9yVUYjvXSp91KXfnZte7MBvYbDElr8F+erUEwZ6jDh8oGrmeTn4V68s+1HXAjIo
	7iejdbTLakDHL51Z1Ftq1k/YTefwPZbz/LWxUD2So1piYTcVFVk+1Dmluabseio272gg0STH1kP
	1M0i5Szap/e/56+V6Pqu0+bFJNpid6AZjUu/G1K2Q
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328713a91.4.1783313756486;
        Sun, 05 Jul 2026 21:55:56 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328696a91.4.1783313755987;
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Received: from [10.204.78.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3114fe08b1bsm12946548eec.26.2026.07.05.21.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Message-ID: <95e8281c-91e9-4444-8b83-ea87243122c9@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:25:47 +0530
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 40/42] misc: fastrpc: Use
 devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        sound-open-firmware@alsa-project.org,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfX26TxnpzfJ9NO
 OSrcluXKW1ShsV3HXYWy842zuGkdMy6cfUnbl/e7AzWPaqintDKKoAXaaYb9xmev7c4mwEiTAos
 g4GOfLj7rnaWl6ulFsIG56B5fwgyYrE=
X-Proofpoint-ORIG-GUID: bkKHJonOeo9oyEZLvPrM7eeN6H6GSwdN
X-Proofpoint-GUID: bkKHJonOeo9oyEZLvPrM7eeN6H6GSwdN
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4b355d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ee02QKOXNWxg8IJ2rEsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfX0dCBYscSHKeo
 6FDL2AvMBCtb1wd9Pmp0rS14aYULEwUH5DYteo5bNLMwFr1vXzd3tRldldXEAo3Km/OfJFIIs/M
 aDdX37OVS+cVI5VuDMwTR/Bl3lhCC2jBP2luHjsQZqxB3BXtSfx4Dx5xaILoYMwNUt2WAW2Gp3h
 B/xBYZnPjPllVx+q5UDZ1BnNuMzo+9HqFRss6HC+3xeS+bOkG6DeCkdeU0NFCu9EDZzTXUbZCSh
 H8UTevGgUELJhhN2wUeVmsVmm9DPJNsudZpuaANfrM42AI0VHJh4QFH2LZo/+VSn5HEFg2+i092
 q5k6fg06jPg7KtzDNLd7U0rjg9xkNwlZ1+gV0Mjy+elYcHr8x50NgpYCgt5YMqA7xWiZ3SOm8+/
 4au1GMHhkDsJf3WWNwHyT9wW8q4DOMUDhmc1BuztXSqKgvwApR7+rW9tQvAnt9KRby6e3yg8V9H
 bCacFSPRebYz7tiknBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060045
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4403-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:sound-open-firmware@alsa-project.org,m:srini@kernel.org,m:konradybcio@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:from_smtp,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC049710324

On 06-07-2026 01:10, Mukesh Ojha wrote:
> Use the devres-managed devm_of_reserved_mem_device_init() to ensure
> the reserved memory region is released on device removal, fixing a
> missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().
nit: I see this change is also fixing fastrpc_rpmsg_probe() early
failure leaks as well as -EPROBE_DEFER retry paths which could be added
to the commit message.

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d86e79134c68..c4e05b0db527 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		return -EINVAL;
>  	}
>  
> -	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
> +	if (devm_of_reserved_mem_device_init(rdev))
>  		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
>  
>  	vmcount = of_property_read_variable_u32_array(rdev->of_node,


