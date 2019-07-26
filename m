Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E6179FB1
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2019 05:59:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yN8Z1LNHzDqNS
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2019 13:58:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45wGsm2KRQzDqRM
 for <linux-aspeed@lists.ozlabs.org>; Sat, 27 Jul 2019 03:53:41 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6QHpYwG138126
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 13:53:38 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u03aqsmjy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 13:53:37 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <linux-aspeed@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Fri, 26 Jul 2019 17:53:37 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 26 Jul 2019 17:53:29 -0000
Received: from us1a3-mail238.a3.dal06.isc4sb.com ([10.146.127.165])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2019072617532908-823110 ;
 Fri, 26 Jul 2019 17:53:29 +0000 
In-Reply-To: <20190726053959.2003-7-andrew@aj.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Fri, 26 Jul 2019 12:53:29 -0500
References: <20190726053959.2003-1-andrew@aj.id.au>
 <20190726053959.2003-7-andrew@aj.id.au>
MIME-Version: 1.0
X-KeepSent: 8D1EDAE6:971111FC-86258443:0062157C;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1 November 29, 2018
X-LLNOutbound: False
X-Disclaimed: 32335
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 006246DF86258443_="
x-cbid: 19072617-9463-0000-0000-0000004D0477
X-IBM-SpamModules-Scores: BY=0.034247; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00011498; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01237805; UDB=6.00652512; IPR=6.01019187; 
 MB=3.00027905; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-26 17:53:35
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-07-26 14:34:20 - 6.00010212
x-cbparentid: 19072617-9464-0000-0000-000000792FA9
Message-Id: <OF8D1EDAE6.971111FC-ON86258443.0062157C-86258443.00624798@notes.na.collabserv.com>
Subject: Re: [PATCH 06/17] ARM: dts: swift: Cleanup gpio-keys-polled properties
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-26_12:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Tue, 30 Jul 2019 13:58:37 +1000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


--=_alternative 006246DF86258443_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Andrew Jeffery <andrew@aj.id.au> wrote on 07/26/2019 12:39:48 AM:

> From: Andrew Jeffery <andrew@aj.id.au>
> To: linux-aspeed@lists.ozlabs.org
> Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org,=20
> mark.rutland@arm.com, joel@jms.id.au, devicetree@vger.kernel.org,=20
> linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,=20
> Adriana Kobylak <anoo@us.ibm.com>
> Date: 07/26/2019 12:40 AM
> Subject: [EXTERNAL] [PATCH 06/17] ARM: dts: swift: Cleanup gpio-
> keys-polled properties
>=20
> dtbs=5Fcheck gave the following warning:
>=20
>     Warning (avoid=5Funnecessary=5Faddr=5Fsize): /gpio-keys-polled:=20
> unnecessary #address-cells/#size-cells without "ranges" or child=20
> "reg" property
>=20
> Cc: Adriana Kobylak <anoo@us.ibm.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Adriana Kobylak <anoo@us.ibm.com>
Tested-by: Adriana Kobylak <anoo@us.ibm.com>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts b/arch/arm/
> boot/dts/aspeed-bmc-opp-swift.dts
> index 2077e8d0e096..9f934509ca1b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> @@ -82,8 +82,6 @@
>=20
>     gpio-keys-polled {
>        compatible =3D "gpio-keys-polled";
> -      #address-cells =3D <1>;
> -      #size-cells =3D <0>;
>        poll-interval =3D <1000>;
>=20
>        scm0-presence {
> --=20
> 2.20.1
>=20



--=_alternative 006246DF86258443_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"


<br><tt><span style=3D" font-size:10pt">Andrew Jeffery &lt;andrew@aj.id.au&=
gt;
wrote on 07/26/2019 12:39:48 AM:<br><br>&gt; From: Andrew Jeffery &lt;andre=
w@aj.id.au&gt;</span></tt><br><tt><span style=3D" font-size:10pt">&gt; To: =
linux-aspeed@lists.ozlabs.org</span></tt><br><tt><span style=3D" font-size:=
10pt">&gt; Cc: Andrew Jeffery &lt;andrew@aj.id.au&gt;,
robh+dt@kernel.org, <br>&gt; mark.rutland@arm.com, joel@jms.id.au, devicetr=
ee@vger.kernel.org,
<br>&gt; linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
<br>&gt; Adriana Kobylak &lt;anoo@us.ibm.com&gt;</span></tt><br><tt><span s=
tyle=3D" font-size:10pt">&gt; Date: 07/26/2019 12:40 AM</span></tt><br><tt>=
<span style=3D" font-size:10pt">&gt; Subject: [EXTERNAL] [PATCH 06/17]
ARM: dts: swift: Cleanup gpio-<br>&gt; keys-polled properties</span></tt><b=
r><tt><span style=3D" font-size:10pt">&gt; <br>&gt; dtbs=5Fcheck gave the f=
ollowing warning:<br>&gt; <br>&gt; &nbsp; &nbsp; Warning (avoid=5Funnecessa=
ry=5Faddr=5Fsize): /gpio-keys-polled:
<br>&gt; unnecessary #address-cells/#size-cells without &quot;ranges&quot;
or child <br>&gt; &quot;reg&quot; property<br>&gt; <br>&gt; Cc: Adriana Kob=
ylak &lt;anoo@us.ibm.com&gt;<br>&gt; Signed-off-by: Andrew Jeffery &lt;andr=
ew@aj.id.au&gt;</span></tt><br><br><tt><span style=3D" font-size:10pt">Revi=
ewed-by: Adriana Kobylak &lt;anoo@us.ibm.com&gt;</span></tt><br><tt><span s=
tyle=3D" font-size:10pt">Tested-by: Adriana Kobylak &lt;anoo@us.ibm.com&gt;=
</span></tt><br><tt><span style=3D" font-size:10pt"><br>&gt; ---<br>&gt; &n=
bsp;arch/arm/boot/dts/aspeed-bmc-opp-swift.dts | 2 --<br>&gt; &nbsp;1 file =
changed, 2 deletions(-)<br>&gt; <br>&gt; diff --git a/arch/arm/boot/dts/asp=
eed-bmc-opp-swift.dts b/arch/arm/<br>&gt; boot/dts/aspeed-bmc-opp-swift.dts=
<br>&gt; index 2077e8d0e096..9f934509ca1b 100644<br>&gt; --- a/arch/arm/boo=
t/dts/aspeed-bmc-opp-swift.dts<br>&gt; +++ b/arch/arm/boot/dts/aspeed-bmc-o=
pp-swift.dts<br>&gt; @@ -82,8 +82,6 @@<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp;=
 gpio-keys-polled {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;compatible =3D &quot=
;gpio-keys-polled&quot;;<br>&gt; - &nbsp; &nbsp; &nbsp;#address-cells =3D &=
lt;1&gt;;<br>&gt; - &nbsp; &nbsp; &nbsp;#size-cells =3D &lt;0&gt;;<br>&gt; =
&nbsp; &nbsp; &nbsp; &nbsp;poll-interval =3D &lt;1000&gt;;<br>&gt; &nbsp;<b=
r>&gt; &nbsp; &nbsp; &nbsp; &nbsp;scm0-presence {<br>&gt; -- <br>&gt; 2.20.=
1<br>&gt; <br></span></tt><BR>

--=_alternative 006246DF86258443_=--

